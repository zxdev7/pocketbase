FROM alpine:latest

# -------- Config --------
ARG PB_VERSION=0.35.1
ENV PB_DATA_DIR=/pb/pb_data

# -------- Dependencies --------
RUN apk add --no-cache \
    unzip \
    ca-certificates \
    bash

# -------- Download PocketBase --------
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip

RUN mkdir -p /pb \
    && unzip /tmp/pb.zip -d /pb \
    && chmod +x /pb/pocketbase \
    && rm /tmp/pb.zip

# -------- Workdir --------
WORKDIR /pb

# -------- Expose Port --------
EXPOSE 8080

# -------- Start Script --------
# - create admin once (if not exists)
# - then start server
CMD sh -c '
if [ -n "$PB_ADMIN_EMAIL" ] && [ -n "$PB_ADMIN_PASSWORD" ]; then
  echo "▶ Checking PocketBase admin..."
  /pb/pocketbase admins create \
    --email "$PB_ADMIN_EMAIL" \
    --password "$PB_ADMIN_PASSWORD" \
    --if-not-exists || true
else
  echo "⚠ PB_ADMIN_EMAIL / PB_ADMIN_PASSWORD not set, skipping admin creation"
fi

echo "▶ Starting PocketBase..."
exec /pb/pocketbase serve \
  --http=0.0.0.0:8080 \
  --dir="$PB_DATA_DIR"
'
