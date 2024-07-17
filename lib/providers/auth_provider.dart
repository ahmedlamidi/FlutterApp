import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// AuthProvider class to manage authentication state
class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Firebase authentication instance
  User? _user; // User object to store the current user
  String? _errorMessage; // Error message string to store any errors

  bool _isCheckingAuthState = true;

  // Constructor to listen to authentication state changes
  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user; // Update the user object
      _isCheckingAuthState = false;
      notifyListeners(); // Notify listeners about the change
    });
  }

  // Getter for the user object
  User? get user => _user;

  // Getter for the error message
  String? get errorMessage => _errorMessage;

  // Getter to check if the user is logged in
  bool get isLoggedIn => _user != null;

  bool get isCheckingAuthState => _isCheckingAuthState;

  Future<void> checkAuthState() async {
    await Future.delayed(const Duration(
        milliseconds: 500)); // Simulate a delay for the splash screen
    _isCheckingAuthState = false;
    notifyListeners();
  }

  // Method to sign in anonymously
  Future<void> anonymousLogin() async {
    try {
      await _auth.signInAnonymously(); // Sign in anonymously
    } catch (e) {
      _errorMessage = e.toString(); // Set the error message
      notifyListeners(); // Notify listeners about the change
    }
  }

  // Method to sign up with email and password
  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ); // Create a new user with email and password
    } catch (e) {
      _errorMessage = e.toString(); // Set the error message
      notifyListeners(); // Notify listeners about the change
    }
  }

  // Method to sign in with email and password
  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ); // Sign in with email and password
    } catch (e) {
      _errorMessage = e.toString(); // Set the error message
      notifyListeners(); // Notify listeners about the change
    }
  }

  // Method to sign in with Google
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      _errorMessage = e.toString(); // Set the error message
      notifyListeners(); // Notify listeners about the change
    }
  }

  // Method to sign out the user
  Future<void> signOut() async {
    try {
      await _auth.signOut(); // Sign out the user
    } catch (e) {
      _errorMessage = e.toString(); // Set the error message
      notifyListeners(); // Notify listeners about the change
    }
  }

  // Method to clear the error message
  void clearError() {
    _errorMessage = null; // Clear the error message
    notifyListeners(); // Notify listeners about the change
  }
}
