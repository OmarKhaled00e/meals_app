import 'package:flutter/material.dart';
import 'package:meals_app/features/onboarding/on_boarding_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch (settings.name) {
    
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(), 
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
        settings: settings,
      );
  }
}