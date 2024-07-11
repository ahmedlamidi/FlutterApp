import '../screens/create_account_screen.dart';
import '../screens/get_started.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';

var appRoutes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => const HomeScreen(),
  '/getstarted': (context) => const GetStarted(),
  '/login': (context) => const LoginScreen(),
  '/createaccount': (context) => const CreateAccountScreen()
};
