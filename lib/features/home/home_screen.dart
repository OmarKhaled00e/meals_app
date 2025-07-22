import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/features/add_meal_screen/add_meal_screen.dart';
import 'package:meals_app/features/home/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:meals_app/features/home/widgets/custom_food_item.dart';
import 'package:meals_app/features/home/widgets/cutom_top_home_part.dart';
import 'package:meals_app/features/home/widgets/grid_view_builder.dart';
import 'package:meals_app/features/meal_details_screen/meal_details_screen.dart';

DbHelper dbHelper = DbHelper.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopHomePart(),
            SizedBox(height: 25.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Text('Your Food', style: TextStyles.black16Madium),
                    ),
                    SizedBox(height: 25.h),
                    Expanded(
                      child: FutureBuilder(
                        future: dbHelper.getMeals(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return Center(
                                child: Text(
                                  'No Meals Found ',
                                  style: TextStyles.black16Madium,
                                ),
                              );
                            }
                            return GridViewBuilder(meals: snapshot.data!);
                          } else if (snapshot.hasError) {
                            return Center(child: Text('${snapshot.error}'));
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.add, color: Colors.white, size: 30.sp),
          onPressed: () {
            Navigator.pushNamed(context, AddMealScreen.routeName);
          },
        ),
      ),
    );
  }
}

