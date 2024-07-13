//fix UI
//lighter background opacity
//skip if already logged in

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gametime/screens/create_account_screen.dart';
import 'package:gametime/screens/login_screen.dart';
import '../widgets/background_image_cycler.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  int _currentImageIndex = 0;
  final List<String> _images = [
    'assets/background/bg1.png',
    'assets/background/bg2.jpeg',
    'assets/background/bg3.jpeg',
    'assets/background/bg4.jpeg',
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startImageCycle();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startImageCycle() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundImageCycler(
            currentImageIndex: _currentImageIndex,
            images: _images,
          ),
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "Let's get\nStarted!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Create Account!'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Already have an account?',
                    selectionColor: Colors.amber,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text(
                      'Sign In',
                      selectionColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
