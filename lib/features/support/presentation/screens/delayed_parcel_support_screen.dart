import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';

/// Screen 04/06: "How can I help you?" (Delayed Parcel Support)
/// Exact 100% pixel match to uploaded image 1 (`media_1794038728672_4637809a.png`)
class DelayedParcelSupportScreen extends StatelessWidget {
  const DelayedParcelSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IphoneMockupFrame(
      timeText: '14:35',
      activeTab: SpxBottomTab.support,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpxSectionEyebrow(
              title: 'DELAYED PARCEL SUPPORT',
              stepText: '04 / 06',
            ),
            const SizedBox(height: 6),
            const Text(
              'How can I help you?',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 12),

            // Top Parcel Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: AppColors.borderLight,
                  width: 0.9,
                ),
              ),
              child: Row(
                children: [
                  SpxCustomIcons.parcelBox(size: 21),
                  const SizedBox(width: 11),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SPXVN-DEMO-261102-0042',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'To Thu Duc City, Ho Chi Minh City',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 11.4,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B717C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'SAMPLE',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 9.8,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                      color: Color(0xFF707682),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Check your parcel status Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 14, 15, 14),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Check your parcel status',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sorting Hub – Ho Chi Minh City\n'
                    'Recorded: 14:20, 02/11/2026 ICT\n'
                    'Awaiting sorting · Hub backlog\n'
                    'Verified in this sample scenario\n'
                    'Estimated delivery: 04–05/11/2026',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.4,
                      fontWeight: FontWeight.w400,
                      height: 1.44,
                      color: Color(0xFF3E434C),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'View details and Next Status Update',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 12.4,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryOrange,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 13.5,
                        color: AppColors.primaryOrange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Or speak with a support agent section
            const Text(
              'Or speak with a support agent',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 9),

            const SpxSecondaryButton(label: 'Contact a support agent'),
            const SizedBox(height: 8),
            const SpxSecondaryButton(label: 'Request a callback'),
            const SizedBox(height: 8),
            const SpxPrimaryButton(
              label: 'Submit Support Request',
              showArrow: true,
            ),
            const SizedBox(height: 11),

            // Request urgent delivery support link
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Request urgent delivery support',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 12.2,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryOrange,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 13,
                  color: AppColors.primaryOrange,
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              'Subject to service availability and operating conditions;\nearlier delivery is not guaranteed.',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.2,
                fontWeight: FontWeight.w400,
                height: 1.38,
                color: Color(0xFF727883),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
