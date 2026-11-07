import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';

/// Screen Modal: "Submit Support Request?" (Confirm Request - Sample Data)
/// Exact 100% pixel match to uploaded image 2 (`media_1794038735456_a0541606.png`)
class ConfirmSupportRequestScreen extends StatelessWidget {
  const ConfirmSupportRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IphoneMockupFrame(
      timeText: '14:35',
      showStandardShell: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.modalOverlayBlack,
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(42),
              topRight: Radius.circular(42),
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 38, 20, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CONFIRM REQUEST - SAMPLE DATA',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 9.8,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.35,
                  color: AppColors.primaryOrange,
                ),
              ),
              const SizedBox(height: 11),
              const Text(
                'Submit Support Request?',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 21.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Parcel details and tracking history will be included.\n'
                'You can go back if you are not ready to submit.',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 12.6,
                  fontWeight: FontWeight.w400,
                  height: 1.44,
                  color: Color(0xFF6B717C),
                ),
              ),
              const SizedBox(height: 16),

              // Light Gray Parcel Summary Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(15, 14, 15, 14),
                decoration: BoxDecoration(
                  color: AppColors.innerGrayCardBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SPXVN-DEMO-261102-0042',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Sorting Hub – Ho Chi Minh City',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 12.6,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Destination: Thu Duc City, Ho Chi Minh City',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 12.2,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B717C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Confirm and submit button
              const SpxPrimaryButton(
                label: 'Confirm and submit',
                showArrow: true,
              ),
              const SizedBox(height: 10),

              // Go back without submitting button
              const SpxSecondaryButton(
                label: 'Go back without submitting',
              ),
              const SizedBox(height: 15),

              const Text(
                'Once submitted, track it under Support Request.',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.4,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6A707B),
                ),
              ),
              const SizedBox(height: 9),
              const Text(
                'Student project · Sample data · Unofficial',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 10.4,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7B818C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
