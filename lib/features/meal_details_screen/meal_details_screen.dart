import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:meals_app/features/home/home_screen.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});
  static const routeName = 'MealDetailsScreen';
  final MealModel meal;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                      ),
                    ),
                    Positioned(
                      left: 12.w,
                      top: 12.h,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HomeScreen.routeName,
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                            size: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.name, style: TextStyles.black24SemiBold),
                    SizedBox(height: 21.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: AppColors.primaryColor,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                meal.time.toString(),
                                style: TextStyles.black16Madium,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                meal.rate.toString(),
                                style: TextStyles.black16Madium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 27.h),
                    Divider(thickness: 2),
                    SizedBox(height: 24.h),
                    Text('Description ', style: TextStyles.black16Madium),
                    SizedBox(height: 8.h),
                    Text(meal.description, style: TextStyles.gray14Madium),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
