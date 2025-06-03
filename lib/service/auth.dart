import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager_firebase/model/index.dart'; // Your custom UserModel

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Convert Firebase [User] to custom [UserModel]
  UserModel? _userFromFirebaseUser(User? user) {
    if (user == null) return null;
    return UserModel(userId: user.uid);
  }

  /// Firebase user auth state changes
  Stream<UserModel?> get user {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user != null) {
        await user.reload(); // Ensure the latest info (emailVerified, etc.)
        user = _auth.currentUser; // Refresh user info after reload
        print("🔄 FirebaseAuth state changed: ${user?.uid}, verified: ${user?.emailVerified}");
      }
      return _userFromFirebaseUser(user);
    });
  }

  /// Register with email and password
  Future<dynamic> registerWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification(); // Send verification email
      }

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return _handleAuthException(e);
    } catch (e) {
      return 'An unknown error occurred during registration.';
    }
  }

  /// Sign in with email and password
  Future<dynamic> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        await user.reload(); // Refresh user info to get latest emailVerified status
        user = _auth.currentUser;

        if (!user!.emailVerified) {
          await _auth.signOut(); // Sign out unverified user
          return 'Please verify your email before logging in.';
        }

        return _userFromFirebaseUser(user);
      }

      return 'Login failed. User is null.';
    } on FirebaseAuthException catch (e) {
      return _handleAuthException(e);
    } catch (e) {
      return 'An unknown error occurred during login.';
    }
  }

  /// Send password reset email
  Future<dynamic> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Password reset email sent.';
    } on FirebaseAuthException catch (e) {
      return _handleAuthException(e);
    } catch (e) {
      return 'An unknown error occurred while sending the reset email.';
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Sign out error: $e");
    }
  }

  /// Handle FirebaseAuthException and return user-friendly messages
  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      default:
        return 'Authentication error: ${e.message}';
    }
  }
}