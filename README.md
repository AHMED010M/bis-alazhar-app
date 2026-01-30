# BIS Alazhar Mobile Application

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" />
</div>

## 📱 Overview

BIS Alazhar is a comprehensive mobile application developed for students of the BIS Alazhar faculty. The app serves as a centralized digital hub integrating essential academic and community services into a single, unified mobile experience.

## ✨ Features

### 🔐 Authentication
- Secure registration with University ID
- Session persistence
- JWT-based authentication

### 📊 Dashboard
- Modern, intuitive home screen
- Quick access to all services
- Dynamic background design

### 📚 Academic Services
- **Class Schedules**: View personalized timetables
- **Study Materials**: Browse lectures and notes by year/term
- **File Management**: Access study files via external apps

### 📝 Notes System
- Browse available course notes
- View detailed note information
- Place orders for physical notes

### 💬 Community Forum
- Browse forum categories and posts
- Create and share posts
- Comment and engage with content
- Upvote system for popular content

### 👤 Profile Management
- View and edit personal information
- Custom avatar selection
- Profile customization

### 🔔 Notifications
- Real-time announcements
- Faculty administration updates
- In-app notification center

## 🏗️ Architecture

### System Architecture
The application follows a three-tier client-server architecture:

```
Mobile Client (Flutter) ⇄ Backend REST API ⇄ Database
```

### Project Structure
```
lib/
├── main.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── study/
│   │   ├── schedule_screen.dart
│   │   └── subjects_screen.dart
│   ├── notes/
│   │   └── notes_screen.dart
│   ├── forum/
│   │   └── forum_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── notifications/
│       └── notifications_screen.dart
├── widgets/
│   ├── dynamic_background.dart
│   ├── dashboard_tile.dart
│   └── app_footer.dart
├── services/
│   └── api_client.dart
└── models/
    ├── user.dart
    ├── post.dart
    ├── note.dart
    └── schedule.dart
```

## 🛠️ Technologies

- **Framework**: Flutter SDK
- **Language**: Dart
- **HTTP Client**: Dio
- **State Management**: Local state (setState)
- **Navigation**: MaterialPageRoute
- **External Links**: url_launcher
- **Authentication**: JWT tokens

## 📋 Requirements

### Non-Functional Requirements
- **Performance**: Main screens load within 2-3 seconds
- **Availability**: Continuous backend service availability
- **Scalability**: Support for increasing users and data
- **Usability**: Simple, consistent, accessible interface
- **Security**: Secure authentication and data protection

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Android emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone https://github.com/AHMED010M/bis-alazhar-app.git
cd bis-alazhar-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## 🔧 Configuration

Update the API base URL in `lib/services/api_client.dart`:
```dart
final baseUrl = 'YOUR_API_BASE_URL';
```

## 📡 API Endpoints

### Authentication
- `POST /auth/login` - User login
- `POST /auth/register` - User registration

### Study
- `GET /study/schedule` - Get class schedule
- `GET /study/subjects` - Get subjects list
- `GET /study/files` - Get study files

### Notes
- `GET /notes` - Get available notes
- `POST /notes/order` - Order notes

### Forum
- `GET /forum/subs` - Get forum categories
- `GET /forum/posts` - Get posts
- `POST /forum/posts` - Create post
- `GET /forum/comments` - Get comments
- `POST /forum/comments` - Create comment
- `POST /forum/posts/{id}/upvote` - Upvote post

### User
- `GET /me` - Get user profile
- `PUT /me` - Update profile
- `GET /notifications` - Get notifications
- `POST /notifications/{id}/read` - Mark as read

## 🗄️ Database Design

### Main Entities
- **User**: Authentication and profile data
- **Schedule**: Class timetables
- **Subject**: Course information
- **StudyFile**: Lecture materials
- **ForumPost**: Community posts
- **ForumComment**: Post comments
- **Note**: Course notes catalog
- **NoteOrder**: Order tracking
- **Notification**: Announcements

## 🔒 Security

- Password hashing on server-side
- HTTPS communication
- JWT token authentication
- Secure local token storage
- Server-side input validation

## 🧪 Testing

Currently implemented:
- Manual functional testing
- API testing (Postman)

Future improvements:
- Automated unit tests
- Widget tests
- Integration tests

## 🚧 Challenges & Solutions

### UI/UX Iteration
**Challenge**: Ambiguous initial design requirements
**Solution**: Iterative prototyping with user feedback

### Home Screen Layout
**Challenge**: GridView overflow issues
**Solution**: Migrated to fixed Column + Row layout for precise control

### Design Consistency
**Challenge**: User rejected glassmorphism theme
**Solution**: Adopted Dynamic Background design system

## 📈 Future Improvements

- [ ] State management (Provider/Riverpod/BLoC)
- [ ] Dynamic academic year configuration
- [ ] Centralized error logging (Crashlytics/Sentry)
- [ ] Full dark mode support
- [ ] Automated testing pipeline
- [ ] Token refresh mechanism
- [ ] Internationalization (i18n)
- [ ] Push notifications
- [ ] Offline support

## 📝 License

This project is licensed under the MIT License.

## 👨‍💻 Developer

Developed by **Abo Salah** ([@AHMED010M](https://github.com/AHMED010M))

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

---

<div align="center">
  Made with ❤️ for BIS Alazhar Students
</div>