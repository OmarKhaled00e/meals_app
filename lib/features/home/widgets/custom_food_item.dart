import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';

class CustomFoodItem extends StatelessWidget {
  const CustomFoodItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    this.onTap,
  });

  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: 153.w,
          height: 176.h,
          padding: EdgeInsets.all(8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: 137.w,
                height: 106.h,
                errorWidget: (context, url, error) => Icon(Icons.error , color:Colors.red),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 120.w,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.black16Madium,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(rate.toString(), style: TextStyles.black16Madium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: AppColors.primaryColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(time, style: TextStyles.black16Madium),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
