import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';

/// Screen 06/06: "Resolution Update" (Resolution Update - 03/11/2026)
/// Exact 100% pixel match to uploaded image 4 (`media_1794038748554_be0b33df.png`)
class ResolutionUpdateScreen extends StatelessWidget {
  const ResolutionUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IphoneMockupFrame(
      timeText: '08:00',
      activeTab: SpxBottomTab.parcels,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpxSectionEyebrow(
              title: 'RESOLUTION UPDATE · 03/11/2026',
              stepText: '06 / 06',
            ),
            const SizedBox(height: 6),
            const Text(
              'Resolution Update',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 6),
            const Text(
              'Your parcel status has been updated.\n'
              'Updated: 08:00, 03/11/2026 ICT.',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 12.2,
                fontWeight: FontWeight.w400,
                height: 1.4,
                color: Color(0xFF6B717C),
              ),
            ),
            const SizedBox(height: 13),

            // Main White Card: "Left the sorting hub"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 16),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // VERIFIED · IN TRANSIT green pill
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.greenBadgeBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.check_circle_outline_rounded,
                              size: 13.5,
                              color: AppColors.greenIcon,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'VERIFIED · IN TRANSIT',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.35,
                                color: AppColors.greenText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Delivery Truck outline icon
                      SpxCustomIcons.deliveryTruck(size: 22),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Left the sorting hub',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.25,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '08:00, 03/11/2026 ICT\n'
                    'SPXVN-DEMO-261102-0042',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.8,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Inner Gray Route Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                    decoration: BoxDecoration(
                      color: AppColors.innerGrayCardBg,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Row(
                      children: [
                        SpxCustomIcons.routePath(size: 20),
                        const SizedBox(width: 11),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sorting Hub – Ho Chi Minh City',
                                style: TextStyle(
                                  fontFamily: AppTextStyles.fontFamily,
                                  fontSize: 12.6,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'To Thu Duc City, Ho Chi Minh City',
                                style: TextStyle(
                                  fontFamily: AppTextStyles.fontFamily,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6B717C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    'Est. delivery · Subject to change',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.4,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    '04–05/11/2026',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Soft Green Card: "Support Request resolved"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 13, 14, 14),
              decoration: BoxDecoration(
                color: AppColors.greenCardBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Icon(
                      Icons.check_circle_outline_rounded,
                      size: 19,
                      color: AppColors.greenIcon,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Support Request resolved',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 13.4,
                            fontWeight: FontWeight.w700,
                            color: AppColors.greenText,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Sorting delay resolved. Your parcel is on its\n'
                          'way to the next facility, not yet delivered.\n'
                          'Request DR-261102-0482 closed at 08:00,\n'
                          '03/11/2026 ICT.',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color: AppColors.greenText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Back to parcel tracking button
            const SpxPrimaryButton(
              label: 'Back to parcel tracking',
              showArrow: true,
            ),
            const SizedBox(height: 9),

            // Contact support again button
            const SpxSecondaryButton(
              label: 'Contact support again',
            ),
          ],
        ),
      ),
    );
  }
}

