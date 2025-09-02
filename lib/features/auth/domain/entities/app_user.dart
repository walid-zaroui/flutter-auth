/// Represents a user in the application
class AppUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  const AppUser({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUser &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          email == other.email &&
          displayName == other.displayName &&
          photoURL == other.photoURL;

  @override
  int get hashCode =>
      uid.hashCode ^
      email.hashCode ^
      displayName.hashCode ^
      photoURL.hashCode;

  @override
  String toString() {
    return 'AppUser{uid: $uid, email: $email, displayName: $displayName, photoURL: $photoURL}';
  }
}