//use flexible and loginbutton class (match UI to figma)
//handle error input and proper error messages
import 'package:flutter/material.dart';
import 'package:gametime/screens/create_account_screen.dart';
import 'package:gametime/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (authProvider.errorMessage != null)
              Text(
                authProvider.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authProvider.signInWithEmail(
                  _emailController.text,
                  _passwordController.text,
                );
                if (authProvider.user != null) {
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Sign In'),
            ),
            ElevatedButton(
              onPressed: () {
                authProvider.signInWithGoogle().then((_) {
                  if (authProvider.user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  }
                }).catchError((error) {
                  print('Error signing in with Google: $error');
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Use Google's branding colors
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Sign In with Google'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen()),
                );
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
