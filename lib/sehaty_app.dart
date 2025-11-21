import 'package:flutter/material.dart';
import 'package:sehaty_application/features/auth/presentation/sign_in/ui/sign_in_screen.dart';

class SehatyApp extends StatelessWidget {
  const SehatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen() ,
    );
  }
}
