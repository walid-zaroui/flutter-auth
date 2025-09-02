# Flutter Auth with Google Sign-In

A Flutter authentication app demonstrating Google Sign-In integration using Firebase Authentication and BLoC state management.

## Features

- 🔐 Google Sign-In authentication
- 🎨 Clean Architecture with BLoC/Cubit pattern
- 🌓 Light and Dark theme support
- 📱 Responsive UI design
- 🔄 Real-time authentication state management

## Setup Instructions

### 1. Firebase Configuration

Before running the app, you need to configure Firebase:

1. **Install Firebase CLI**:
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase**:
   ```bash
   firebase login
   ```

3. **Install FlutterFire CLI**:
   ```bash
   dart pub global activate flutterfire_cli
   ```

4. **Configure Firebase for your project**:
   ```bash
   flutterfire configure
   ```
   
   This will:
   - Create a new Firebase project or select an existing one
   - Generate `lib/firebase_options.dart` with your project configuration
   - Set up platform-specific configuration files

### 2. Platform-Specific Setup

#### Android
1. The `flutterfire configure` command should have created `android/app/google-services.json`
2. Enable Google Sign-In in your Firebase Console:
   - Go to Authentication > Sign-in method
   - Enable Google as a sign-in provider
   - Add your SHA-1 certificate fingerprint

#### iOS
1. The `flutterfire configure` command should have created `ios/Runner/GoogleService-Info.plist`
2. Add the URL scheme to `ios/Runner/Info.plist`:
   ```xml
   <key>CFBundleURLTypes</key>
   <array>
       <dict>
           <key>CFBundleURLName</key>
           <string>REVERSED_CLIENT_ID</string>
           <key>CFBundleURLSchemes</key>
           <array>
               <string>YOUR_REVERSED_CLIENT_ID</string>
           </array>
       </dict>
   </array>
   ```
   Replace `YOUR_REVERSED_CLIENT_ID` with the value from `GoogleService-Info.plist`

### 3. Dependencies

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  flutter_bloc: ^8.1.3
  google_sign_in: ^6.1.6
  equatable: ^2.0.5

# Optional: Add Google icon asset
assets:
  - lib/assets/google_icon.png
```

### 4. Run the App

```bash
flutter pub get
flutter run
```

## Architecture

This app follows Clean Architecture principles:

```
lib/
├── features/
│   ├── auth/
│   │   ├── domain/
│   │   │   └── entities/          # AppUser entity
│   │   ├── data/
│   │   │   ├── auth_repo.dart     # Repository interface
│   │   │   └── firebase_auth_repo.dart # Firebase implementation
│   │   └── presentation/
│   │       ├── cubits/            # BLoC state management
│   │       └── pages/             # Login page
│   └── home/
│       └── presentation/
│           └── pages/             # Home page
├── shared/
│   ├── components/                # Reusable widgets
│   └── themes/                   # App themes
├── firebase_options.dart         # Firebase configuration
└── main.dart                     # App entry point
```

## State Management

The app uses `flutter_bloc` with Cubit for state management:

- **AuthCubit**: Manages authentication state and operations
- **AuthStates**: Defines all possible authentication states
- **Repository Pattern**: Abstracts Firebase operations

## Troubleshooting

1. **Firebase configuration issues**: Make sure you've run `flutterfire configure` and the generated `firebase_options.dart` contains your actual project configuration.

2. **Google Sign-In not working**: Verify that:
   - Google Sign-In is enabled in Firebase Console
   - Platform-specific configuration files are properly set up
   - SHA-1 fingerprint is added for Android

3. **Build issues**: Run `flutter clean && flutter pub get` to refresh dependencies.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request