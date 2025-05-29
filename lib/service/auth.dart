import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._internal();

  // Singleton Object
  static final AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;

  // FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get firebaseAuth => _auth;
}