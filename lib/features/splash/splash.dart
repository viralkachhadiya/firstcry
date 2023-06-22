

import 'package:demo_task/features/home/home.dart';
import 'package:demo_task/features/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    if(FirebaseAuth.instance.currentUser != null){
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
    }else {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (BuildContext context) => const Login(),
        ),
      );
    }
  }

  @override
  void initState() {
    navigate(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Center(
        child: Image.asset('assets/firstcry-logo.png',height: 160,width: 200,)
      ),
    );
  }
}

