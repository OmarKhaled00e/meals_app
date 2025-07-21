import 'package:flutter/material.dart';
import 'package:meals_app/features/add_meal_screen/add_meal_screen.dart';
import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:meals_app/features/home/home_screen.dart';
import 'package:meals_app/features/meal_details_screen/meal_details_screen.dart';
import 'package:meals_app/features/onboarding/on_boarding_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch (settings.name) {
    
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(), 
      );
    case MealDetailsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final meal = settings.arguments as MealModel;
          return MealDetailsScreen(meal: meal);
        }
      );
    case AddMealScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddMealScreen(), 
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
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