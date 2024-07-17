//ADD FADE

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/animated_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  Future<void> _initSplashScreen(BuildContext context) async {
    await Future.delayed(
        const Duration(seconds: 2)); // Minimum display time for splash screen
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.checkAuthState();
    if (authProvider.isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/getstarted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initSplashScreen(context),
      builder: (context, snapshot) {
        // Always show the splash screen while the future is running
        return Scaffold(
          backgroundColor: Colors.grey.shade800,
          body: Center(
            child: AnimatedLogo(isExpanded: _isExpanded),
          ),
        );
      },
    );
  }
}
