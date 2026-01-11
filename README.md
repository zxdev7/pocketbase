# PocketBase Docker Deployment

A containerized deployment setup for PocketBase - an open-source backend solution that provides a realtime database, authentication, file storage, and admin dashboard in a single executable.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/pocketbase-for-production?referralCode=Mq5C3m&utm_medium=integration&utm_source=template&utm_campaign=generic)

## 🚀 Features

- **Lightweight**: Built on Alpine Linux for minimal footprint
- **Ready-to-deploy**: Pre-configured Docker setup
- **Scalable**: Easy deployment on cloud platforms
- **Real-time Database**: SQLite with real-time subscriptions
- **Built-in Auth**: User authentication and authorization
- **File Storage**: Built-in file upload and management
- **Admin Dashboard**: Web-based admin interface
- **REST API**: Auto-generated REST API endpoints

## 📋 Requirements

- Docker
- Docker Compose (optional)

## 🛠️ Configuration

This setup uses PocketBase version `0.35.1` and exposes the service on port `8080`.

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PB_VERSION` | PocketBase version to install | `0.35.1` |

## 🚀 Quick Start

### Using Docker

1. **Clone this repository**
   ```bash
   git clone <your-repo-url>
   cd pocketbase
   ```

2. **Build and run the container**
   ```bash
   docker build -t pocketbase .
   docker run -p 8080:8080 pocketbase
   ```

3. **Access PocketBase**
   - Open your browser and navigate to `http://localhost:8080/_/`
   - Create your admin account on first visit

### Using Docker Compose

Create a `docker-compose.yml` file:

```yaml
version: '3.8'
services:
  pocketbase:
    build: .
    ports:
      - "8080:8080"
    volumes:
      - pb_data:/pb/pb_data
    restart: unless-stopped

volumes:
  pb_data:
```

Then run:
```bash
docker-compose up -d
```

## 🌐 Deploy to Railway

Deploy this PocketBase instance to Railway with one click:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/pocketbase?referralCode=bonus)

### Manual Railway Deployment

1. Fork this repository
2. Connect your Railway account to GitHub
3. Create a new project from your forked repository
4. Railway will automatically detect the Dockerfile and deploy
5. Your PocketBase instance will be available at the generated Railway URL

## 📁 Project Structure

```
.
├── Dockerfile          # Docker configuration
└── README.md          # This file
```

### Optional Directories

You can uncomment lines in the Dockerfile to include:

- `pb_migrations/` - Database migration files
- `pb_hooks/` - Custom JavaScript hooks

## 🔧 Customization

### Adding Migrations

1. Create a `pb_migrations/` directory
2. Add your migration files
3. Uncomment line 14 in the Dockerfile:
   ```dockerfile
   COPY ./pb_migrations /pb/pb_migrations
   ```

### Adding Hooks

1. Create a `pb_hooks/` directory
2. Add your JavaScript hook files
3. Uncomment line 17 in the Dockerfile:
   ```dockerfile
   COPY ./pb_hooks /pb/pb_hooks
   ```

### Using Different PocketBase Version

Build with a different version:
```bash
docker build --build-arg PB_VERSION=0.34.0 -t pocketbase .
```

## 📚 PocketBase Documentation

- [Official Documentation](https://pocketbase.io/docs/)
- [JavaScript SDK](https://github.com/pocketbase/js-sdk)
- [Dart SDK](https://github.com/pocketbase/dart-sdk)
- [Go SDK](https://github.com/pocketbase/pocketbase)

## 🔒 Security Considerations

- Change default admin credentials immediately after deployment
- Use environment variables for sensitive configuration
- Enable HTTPS in production
- Regularly backup your database
- Keep PocketBase version updated

## 📝 API Usage

Once deployed, you can interact with your PocketBase instance:

```javascript
import PocketBase from 'pocketbase';

const pb = new PocketBase('http://your-railway-url.railway.app');

// Create a new record
const record = await pb.collection('posts').create({
    title: 'Hello World',
    content: 'This is my first post!'
});

// List records
const records = await pb.collection('posts').getList(1, 50);
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🆘 Support

- [PocketBase Discussions](https://github.com/pocketbase/pocketbase/discussions)
- [Discord Community](https://discord.gg/pocketbase)
- [GitHub Issues](https://github.com/pocketbase/pocketbase/issues)

---

**Built with ❤️ using PocketBase and Docker**
# pocketbase
