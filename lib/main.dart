import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:smart_app/Screens/business_details_form.dart';
import 'package:smart_app/Screens/home_dashboard.dart';
import 'package:smart_app/Screens/personal_details_form.dart';
import 'package:smart_app/Screens/profile.dart';
import 'package:smart_app/Screens/tools.dart';
import 'Screens/bottom_nav_bar.dart';
import 'Screens/login_screen.dart';
import 'Screens/wallet.dart';
import 'Services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      title: 'SMART',
      theme: ThemeData(
        fontFamily: 'Muli',
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black87,
        ),
        // brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 16),
          button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
          headline1: TextStyle(fontWeight: FontWeight.bold),
          headline2: TextStyle(color: Colors.grey),
        ),
        buttonTheme: const ButtonThemeData(),
      ),
      routes: {
        '/': (context) => const LoginScreen(),
        '/navBar': (context) => const BottomNavBar(),
        '/dashboard': (context) => const HomeDashboard(),
        '/tools': (context) => const Tools(),
        '/wallet': (context) => const Wallet(),
        '/profile': (context) => Profile(),
        '/personalDetails': (context) => const PersonalDetails(),
        '/businessDetails': (context) => const BusinessDetails(),
      },
      // home: const BottomNavBar(),
    );
  }
}
