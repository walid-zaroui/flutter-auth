import '../domain/entities/app_user.dart';

/// Abstract repository for authentication operations
abstract class AuthRepository {
  /// Get the current authenticated user
  AppUser? get currentUser;

  /// Stream of authentication state changes
  Stream<AppUser?> get authStateChanges;

  /// Sign in with Google
  Future<AppUser?> signInWithGoogle();

  /// Sign out the current user
  Future<void> signOut();
}