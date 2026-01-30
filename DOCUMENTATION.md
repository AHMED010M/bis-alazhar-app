# BIS Alazhar Mobile Application — Full Project Documentation

## 1. Executive Summary

The BIS Alazhar mobile application is a comprehensive Flutter-based platform developed to serve as a centralized digital hub for students of the BIS Alazhar faculty. The application integrates essential academic and community services—including class schedules, study materials, a student forum, note ordering, notifications, and profile management—into a single, unified mobile experience.

The project underwent a highly iterative development process, including a complete UI/UX redesign that transformed a basic interface into a modern, visually consistent, and user-friendly application. Multiple technical and design challenges—particularly related to layout management and design consistency—were resolved through architectural refactoring and iterative user feedback, resulting in a stable and polished final product suitable for real-world academic use.

## 2. Project Overview and Purpose

### Purpose
To improve the academic and digital experience of BIS Alazhar students by providing a single mobile application that centralizes access to academic resources, communication tools, and student services.

### Scope
The application enables students to:
- Securely register and authenticate using a University ID
- View personalized class schedules
- Browse and access study materials (lectures, notes, files) organized by academic year and term
- Browse, view details of, and order physical course notes
- Participate in a student community forum (posting, commenting, and upvoting)
- Receive official announcements and notifications from faculty administration
- View and manage personal profile information

## 3. System Architecture

The system follows a standard client-server architecture.

### High-Level Architecture
A three-tier architecture:
1. **Mobile Client** (Flutter - Android)
2. **Backend REST API Server**
3. **Database Layer**

Data flows bidirectionally between:
- Mobile Client ⇄ Backend API
- Backend API ⇄ Database

### Components

#### Client (Flutter Application)

**Feature-Based Modules:**
- Authentication
- Home (Dashboard)
- Study (Schedule & Materials)
- Notes Ordering
- Forum
- Profile
- Notifications

**Reusable UI Components:**
- Custom shared widgets:
  - DynamicBackground
  - DashboardTile
  - AppFooter
- These ensure consistent design across all screens

**Networking Layer:**
- Dio HTTP client
- ApiClient service abstraction

**State Management:**
- Local widget state using setState()
- Chosen for simplicity and suitability for the current project scale

#### Backend (Assumption)
- RESTful API exposing endpoints for all features
- Business logic for:
  - Authentication and authorization
  - Data validation
  - Request processing

#### Database (Assumption)
- Relational or NoSQL database for persistent data storage

## 4. Technologies and Tools Used

- **Frontend**: Flutter SDK, Dart
- **HTTP Client**: Dio
- **Local Secure Storage**: flutter_secure_storage or shared_preferences for token persistence
- **Navigation**: Flutter MaterialPageRoute
- **External File Access**: url_launcher
- **Authentication Tokens**: JWT (assumed)

## 5. Functional Requirements

### Authentication
- Users must be able to register using:
  - University ID
  - Full name
  - Password
  - Avatar type
- Users must be able to log in using University ID and password
- Users must remain logged in across sessions

### Dashboard
- The home screen must display six main services
- All dashboard options must be visible on a single non-scrollable screen

### Academic Services
- Users must be able to:
  - View class schedules
  - Browse study subjects and files
  - Open study files via external applications

### Notes
- Users must be able to:
  - Browse available course notes
  - View note details
  - Place note orders

### Forum
- Users must be able to:
  - View forum categories and posts
  - Create posts
  - Comment on posts
  - Upvote posts

### Profile
- Users must be able to:
  - View profile data
  - Edit personal information

## 6. Non-Functional Requirements

### Performance
The application should load main screens within acceptable mobile UX limits (< 2–3 seconds under normal network conditions).

### Availability
Backend services should be continuously available for student access (subject to hosting constraints).

### Scalability
The architecture should support increasing numbers of users and data records.

### Usability
The UI must remain simple, consistent, and accessible for non-technical users.

### Maintainability
Feature-based modular structure to support future development and refactoring.

### Security
- Secure authentication and token handling
- Protection of user credentials and personal data

## 7. Database Design (Inferred)

### Main Entities (Logical Model)

#### User
- id
- university_id
- full_name
- password_hash
- avatar_type

#### Schedule
- id
- user_id
- subject_id
- day
- time

#### Subject
- id
- name
- year
- term

#### StudyFile
- id
- subject_id
- file_url
- file_type

#### ForumPost
- id
- user_id
- title
- content
- created_at
- upvotes_count

#### ForumComment
- id
- post_id
- user_id
- content
- created_at

#### Note
- id
- subject_id
- price
- description

#### NoteOrder
- id
- user_id
- note_id
- status
- created_at

#### Notification
- id
- user_id
- message
- is_read
- created_at

## 8. API Design and Main Endpoints (Inferred)

### Authentication
- POST /auth/login
- POST /auth/register

### Study
- GET /study/schedule
- GET /study/subjects
- GET /study/files

### Notes
- GET /notes
- POST /notes/order

### Forum
- GET /forum/subs
- GET /forum/posts
- POST /forum/posts
- GET /forum/comments
- POST /forum/comments
- POST /forum/posts/{id}/upvote

### User & Notifications
- GET /me
- PUT /me
- GET /notifications
- POST /notifications/{id}/read

## 9. Authentication and Authorization Flow

1. User submits credentials from LoginScreen
2. Client sends POST request to /auth/login
3. Server validates credentials against database
4. Server returns JWT access token
5. Client securely stores token
6. Token is attached to Authorization header for protected requests
7. On app launch, token presence is checked to restore session

## 10. Security Considerations

- Passwords are stored as hashed values (assumed)
- Communication should occur over HTTPS
- JWT tokens used for authentication
- Token expiration and renewal should be enforced (future improvement)
- Basic server-side input validation
- Secure local storage for tokens

## 11. Error Handling and Logging

- Client displays user-friendly error messages
- API errors are handled through Dio interceptors
- No centralized crash/error logging implemented
- Future integration recommended:
  - Firebase Crashlytics
  - Sentry

## 12. Testing Strategy

**(Currently Limited)**
- Manual functional testing of all screens and flows
- API testing (assumed via tools like Postman)
- No automated unit or widget tests implemented

**Future improvements:**
- Flutter widget tests
- Unit tests for business logic
- API integration tests

## 13. Problems and Challenges Faced

### Challenge 1: Ambiguous Initial UI/UX Goals
**Problem**: Subjective requirement to "make the app look better."
**Solution**: Iterative UI prototyping and design system propagation.

### Challenge 2: User-Driven Design Rejection
**Problem**: Glassmorphism theme rejected by user.
**Solution**: Rapid rollback and adoption of a Dynamic Background design.

### Challenge 3: Critical Home Screen Layout Bug
**Problem**: Grid overflow causing clipped icons.
**Failed Attempts:**
- childAspectRatio tuning
- shrinkWrap usage

**Final Solution:**
- Replaced GridView with fixed Column + Rows layout
- Gained full control over layout sizing
- Successfully met non-scrollable requirement

## 14. Limitations and Future Improvements

- Migration to robust state management (Provider, Riverpod, BLoC)
- Dynamic configuration of academic years from API
- Centralized logging and monitoring
- Proper date/time formatting using intl
- Full Dark Mode support
- Automated testing pipeline
- Token refresh and advanced security policies

## 15. Architecture & Flow Diagrams

### System Context Diagram
```
User → Flutter App → REST API → Database → REST API → Flutter App → User
```

### Authentication Sequence Diagram
```
User → Login Screen → API Login → Token Issued → Token Stored → Authorized Requests
```

---

**Document Version**: 1.0  
**Last Updated**: January 2026  
**Author**: Development Team
