//adjust space between text widgets
//skip if already logged in

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gametime/screens/create_account_screen.dart';
import 'package:gametime/screens/login_screen.dart';
import '../widgets/background_image_cycler.dart';
import 'package:google_fonts/google_fonts.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Let's Get",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.handjet(
                      textStyle: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Started!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.handjet(
                      textStyle: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 1),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      backgroundColor: Colors.teal,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text(
                      'Create Account!',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text(
                      'Log In',
                      selectionColor: Colors.white,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
