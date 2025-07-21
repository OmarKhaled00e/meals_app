import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/custom_button.dart';
import 'package:meals_app/core/widgets/custom_text_field.dart';
import 'package:meals_app/features/home/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:meals_app/features/home/home_screen.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});
  static const routeName = 'AddMealScreen';
  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DbHelper dbHelper = DbHelper.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Add Meal', style: TextStyles.black16Madium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: fromKey,
            child: isLoading
                ? SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: SizedBox(
                        width: 40.sp,
                        height: 40.sp,
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Meal Name', style: TextStyles.black16Madium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: mealNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please add meal name';
                          } else if (value.length < 3) {
                            return 'please add more than 3 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text('Image URl', style: TextStyles.black16Madium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: imageUrlController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please add image name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text('Rate', style: TextStyles.black16Madium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        keyboardInputType: TextInputType.number,
                        controller: rateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please add rate ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text('Time', style: TextStyles.black16Madium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        keyboardInputType: TextInputType.number,
                        controller: timeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please add Time for Meal ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text('Description', style: TextStyles.black16Madium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        keyboardInputType: TextInputType.number,
                        controller: descriptionController,
                        maxLines: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please add rate ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 70.h),
                      CustomButton(
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            final meal = MealModel(
                              name: mealNameController.text,
                              imageUrl: imageUrlController.text,
                              description: descriptionController.text,
                              time: timeController.text,
                              rate: double.parse(rateController.text),
                            );
                            dbHelper.insertMeal(meal).then((value) {
                              Navigator.pushReplacementNamed(
                                context,
                                HomeScreen.routeName,
                              );
                            });
                          }
                        },
                        text: 'Add Meal',
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
