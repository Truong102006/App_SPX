import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';

/// Screen 02/06: "Why is my parcel delayed?" (Reason For The Delay)
/// Exact 100% pixel match to uploaded image (`media_1794038934673_732324fe.png`)
class ReasonForDelayScreen extends StatelessWidget {
  const ReasonForDelayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IphoneMockupFrame(
      timeText: '14:30',
      activeTab: SpxBottomTab.parcels,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpxSectionEyebrow(
              title: 'REASON FOR THE DELAY',
              stepText: '02 / 06',
            ),
            const SizedBox(height: 6),
            const Text(
              'Why is my parcel delayed?',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 12),

            // Top Parcel Summary Card with SAMPLE badge
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

            // Main White Verification Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Verified Pill Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.greenBadgeBg,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SpxCustomIcons.verifiedSeal(
                          size: 13.5,
                          color: AppColors.primaryOrange,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Verified',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 11.2,
                            fontWeight: FontWeight.w700,
                            color: AppColors.greenText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Sorting Hub Row with Warehouse Icon
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F3F5),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        alignment: Alignment.center,
                        child: SpxCustomIcons.warehouseHub(
                          size: 24,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sorting Hub – Ho Chi Minh City',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Processing stage: sorting',
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
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Main Backlog Explanation
                  const Text(
                    'A hub backlog is delaying sorting.\n'
                    'Your parcel cannot move to the next\n'
                    'facility until sorting is complete.',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Thin Divider
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFFECEEF1),
                  ),
                  const SizedBox(height: 13),

                  // Verified Timestamp & Disclaimer
                  const Text(
                    'Verified: 14:20, 02/11/2026 ICT',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Sample verification for this project;\n'
                    'not a direct confirmation from SPX.',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.2,
                      fontWeight: FontWeight.w400,
                      height: 1.38,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Info Notice Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(
                    Icons.info_outline_rounded,
                    size: 16,
                    color: Color(0xFF5D636F),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'No need to resubmit your request yet.\n'
                    'Check the next update for the latest information.',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.6,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Primary Action Button: View update time ->
            const SpxPrimaryButton(
              label: 'View update time',
              showArrow: true,
            ),
            const SizedBox(height: 12),

            // Centered Footer Note
            const Center(
              child: Text(
                'Updates are provided even if the status is unchanged.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF727883),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
