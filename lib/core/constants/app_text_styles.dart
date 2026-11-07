import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Segoe UI';

  static const TextStyle bannerLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 9.5,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.7,
    color: Color(0xFF6B707B),
  );

  static const TextStyle sectionEyebrow = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.5,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.65,
    color: Color(0xFF696F7A),
  );

  static const TextStyle stepCounter = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    color: Color(0xFF696F7A),
  );

  static const TextStyle pageTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22.5,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.8,
    fontWeight: FontWeight.w400,
    height: 1.42,
    color: AppColors.textSecondary,
  );

  static const TextStyle primaryButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: -0.1,
  );

  static const TextStyle secondaryButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.1,
  );
}

