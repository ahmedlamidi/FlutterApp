//need xCode for iOS

import 'package:flutter/material.dart';
import 'package:gametime/screens/splash_screen.dart';
import 'package:gametime/theme.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_initializer.dart';
import 'providers/auth_provider.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await initializeFirebase();

    runApp(
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: const MyApp(),
      ),
    );
  } catch (e) {
    runApp(ErrorApp(e.toString()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameTime',
      theme: appTheme,
      // home: AuthWrapper(),
      home: SplashScreen(),
      routes: appRoutes,
    );
  }
}

class ErrorApp extends StatelessWidget {
  final String error;

  const ErrorApp(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Error initializing Firebase: $error'),
        ),
      ),
    );
  }
}
