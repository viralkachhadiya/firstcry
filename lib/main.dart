import 'package:demo_task/core/provider/internet_provider.dart';
import 'package:demo_task/core/provider/sign_in_provider.dart';
import 'package:demo_task/core/utills/shared_preference.dart';
import 'package:demo_task/features/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider<InternetProvider>(
          create: (context) => InternetProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: 'FirstCry',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            titleTextStyle: TextStyle(
              color: Colors.black,
            ),

          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}


