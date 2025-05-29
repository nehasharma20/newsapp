# Flutter News App

## Code Structure

lib/
│
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   ├── services/
│   ├── utils/
│   └── widgets/
│
├── models/
│   ├── news_article.dart
│
├── viewmodels/
│   ├── auth_viewmodel.dart
│   ├── news_viewmodel.dart
│   └── bookmark_viewmodel.dart
│
├── views/
│   ├── auth/
│   │   └── login_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── news/
│   │   ├── news_screen.dart
│   │   └── webview_screen.dart
│   └── bookmarks/
│       └── bookmark_screen.dart
│
├── data/
│   └── news_api_service.dart



## Features
- Firebase Email/Password Login
- Persistent Login Session
- News Feed from NewsAPI
- WebView for Full Articles
- Bookmark Articles
- Offline Bookmark Persistence

## Architecture
- MVVM pattern
- Provider for state management
- Clean separation of data, UI, logic

## Setup
1. Clone repo
2. Add your `google-services.json` file
3. Replace `YOUR_NEWS_API_KEY` in `news_api_service.dart`
4. Run `flutter pub get`
5. Run the app

## Screenshots
Screenshot- news
          -bookmark

## Packages Used
- `firebase_auth`: Firebase Authentication
- `provider`: State management
- `shared_preferences`: Persistent storage
- `http`: API calls
- `webview_flutter`: Show article content
