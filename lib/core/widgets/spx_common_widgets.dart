import 'spx_interactive.dart';
import '../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

/// Primary solid rust-orange button with optional trailing right arrow.
class SpxPrimaryButton extends StatelessWidget {
  final String label;
  final bool showArrow;
  final VoidCallback? onTap;

  const SpxPrimaryButton({
    super.key,
    required this.label,
    this.showArrow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SpxInteractive(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 46,
        decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(11),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: LocalizedText(
              label,
              style: AppTextStyles.primaryButton,
            )),
            if (showArrow) ...[
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_forward_rounded,
                size: 15,
                color: Colors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Secondary white outlined button with dark bold text.
class SpxSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const SpxSecondaryButton({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SpxInteractive(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: AppColors.borderLight,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: LocalizedText(
          label,
          style: AppTextStyles.secondaryButton,
        ),
      ),
    );
  }
}

/// Standard section eyebrow row with step indicator on the right (e.g., "PARCEL TRACKING" ... "01 / 06").
class SpxSectionEyebrow extends StatelessWidget {
  final String title;
  final String stepText;

  const SpxSectionEyebrow({
    super.key,
    required this.title,
    required this.stepText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: LocalizedText(
          title,
          style: AppTextStyles.sectionEyebrow,
        )),
        LocalizedText(
          stepText,
          style: AppTextStyles.stepCounter,
        ),
      ],
    );
  }
}
