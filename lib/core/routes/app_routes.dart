import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehaty_application/core/routes/routes.dart';
import 'package:sehaty_application/features/auth/data/models/user_model.dart';
import 'package:sehaty_application/features/auth/presentation/sign_up/ui/sign_up_screen.dart';
import 'package:sehaty_application/features/home/presentation/cubit/home_cubit.dart';
import 'package:sehaty_application/features/home/presentation/ui/home_screen.dart';

import '../../features/auth/presentation/sign_in/sign_in_cubit.dart';
import '../../features/auth/presentation/sign_in/ui/sign_in_screen.dart';
import '../../features/auth/presentation/sign_up/ui/cubit/sign_up_cubit.dart';

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
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => SignInCubit(),
              child: SignInScreen(),
            ));

      case Routes.homeScreen :
        final user = setting.arguments as UserModel;
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => HomeCubit()..loadDataUser(user),
              child: HomeScreen(),
            ));
    }
    return null;
  }
}