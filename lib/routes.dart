// ignore: unused_import
import 'package:gametime/screens/splash_screen.dart';
import '../screens/create_account_screen.dart';
import '../screens/get_started.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

var appRoutes = {
  '/home': (context) => const HomeScreen(),
  '/getstarted': (context) => const GetStarted(),
  '/login': (context) => const LoginScreen(),
  '/createaccount': (context) => const CreateAccountScreen()
};
