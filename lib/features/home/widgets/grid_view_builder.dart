import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:meals_app/features/home/widgets/custom_food_item.dart';
import 'package:meals_app/features/meal_details_screen/meal_details_screen.dart';

class GridViewBuilder extends StatelessWidget {
  final List<MealModel> meals;
  const GridViewBuilder({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: meals.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 22.sp,
            crossAxisSpacing: 16.sp,
            childAspectRatio: 0.9,
            crossAxisCount: 2,
          ),
      itemBuilder: (context, index) {
        MealModel meal = meals[index];
        return CustomFoodItem(
          onTap: () {
            Navigator.pushNamed(
              context,
              MealDetailsScreen.routeName,
              arguments: meal,
            );
          },
          imageUrl: meal.imageUrl,
          name: meal.name,
          rate: meal.rate,
          time: meal.time,
        );
      },
    );
  }
}
