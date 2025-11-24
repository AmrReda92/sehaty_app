import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehaty_application/core/routes/app_routes.dart';
import 'package:sehaty_application/core/routes/routes.dart';
import 'package:sehaty_application/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:sehaty_application/features/auth/presentation/sign_up/ui/sign_up_screen.dart';

class SehatyApp extends StatefulWidget {
  const SehatyApp({super.key});

  @override
  State<SehatyApp> createState() => _SehatyAppState();
}

class _SehatyAppState extends State<SehatyApp> {

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('=====================User is currently signed out!');
      } else {
        print('======================User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Routes.signUpScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
