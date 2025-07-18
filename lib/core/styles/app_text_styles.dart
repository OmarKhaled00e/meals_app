import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/core/styles/app_colors.dart';

class TextStyles {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle onBoardingDescriptionStyle = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );
  static TextStyle inter14SemiBold = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle black16Madium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle gray14Madium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0XFF878787),
  );
}
