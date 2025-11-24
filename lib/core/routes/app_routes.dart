import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehaty_application/core/routes/routes.dart';
import 'package:sehaty_application/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:sehaty_application/features/auth/presentation/sign_in/ui/sign_in_screen.dart';
import 'package:sehaty_application/features/auth/presentation/sign_up/ui/sign_up_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.signUpScreen :
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => SignUpCubit(),
              child: SignUpScreen(),
            ));

      case Routes.signInpScreen :
        return MaterialPageRoute(builder: (_) => SignInScreen());
    }
    return null;
  }
}