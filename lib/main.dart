import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/helper_functions/on_generate_routes.dart';

import 'package:meals_app/features/onboarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MealsApp());
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meals App',
          onGenerateRoute: onGenerateRoute,
          initialRoute: OnBoardingScreen.routeName,
        );
      },
    );
  }
}
