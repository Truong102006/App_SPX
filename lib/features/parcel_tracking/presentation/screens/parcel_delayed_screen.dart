import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';

/// Screen 01/06: "Your parcel may be delayed" (Parcel Tracking)
/// Exact 100% pixel match to uploaded image 5 (`media_1794038755892_525ee283.png`)
class ParcelDelayedScreen extends StatelessWidget {
  const ParcelDelayedScreen({super.key});

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
              title: 'PARCEL TRACKING',
              stepText: '01 / 06',
            ),
            const SizedBox(height: 6),
            const Text(
              'Your parcel may be delayed',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 7),
            // Tracking ID Row with Copy icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'SPXVN-DEMO-261102-0042',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5A606A),
                  ),
                ),
                SpxCustomIcons.copyIcon(size: 16),
              ],
            ),
            const SizedBox(height: 12),

            // Peach Delay Alert Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 15),
              decoration: BoxDecoration(
                color: AppColors.peachAlertBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.peachIconBoxBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.access_time_rounded,
                      size: 20,
                      color: AppColors.primaryOrange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your parcel may arrive later than\nexpected.',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 14.2,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            color: AppColors.textAlertBrown,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Verified (example):\nsorting backlog.',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                            height: 1.35,
                            color: AppColors.textAlertBody,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Last Recorded Location Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 14, 15, 15),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.primaryOrange,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'LAST RECORDED LOCATION',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                          color: Color(0xFF5D636E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sorting Hub – Ho Chi Minh City',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 15.2,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Awaiting sorting',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.8,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Updated: 14:20, 02/11/2026 ICT',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // View parcel details button
            const SpxPrimaryButton(
              label: 'View parcel details',
              showArrow: true,
            ),
            const SizedBox(height: 12),

            // Delivery Progress Stepper Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 14, 15, 15),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery progress',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 14.8,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 14),
                  _DeliveryProgressStepper(),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Footer timestamps
            const Text(
              'Next Status Update: before 08:30, 03/11/2026 ICT.\nDelay alert: 14:30, 02/11/2026 · ICT (UTC+7)',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.4,
                fontWeight: FontWeight.w400,
                height: 1.45,
                color: Color(0xFF6A707B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryProgressStepper extends StatelessWidget {
  const _DeliveryProgressStepper();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: [
              // Node 1: Picked up (Completed)
              _buildActiveCheckCircle(),
              // Line 1 -> 2 (Active Orange)
              Expanded(
                child: Container(
                  height: 2,
                  color: AppColors.primaryOrange,
                ),
              ),
              // Node 2: Sorting (Current Active Dot)
              _buildCurrentSortingCircle(),
              // Line 2 -> 3 (Inactive Gray)
              Expanded(
                child: Container(
                  height: 2,
                  color: AppColors.timelineInactive,
                ),
              ),
              // Node 3: In transit (Inactive Dot)
              _buildInactiveCircle(),
              // Line 3 -> 4 (Inactive Gray)
              Expanded(
                child: Container(
                  height: 2,
                  color: AppColors.timelineInactive,
                ),
              ),
              // Node 4: Delivered (Inactive Dot)
              _buildInactiveCircle(),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Picked up',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.2,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6E747F),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 6),
              child: Text(
                'Sorting',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryOrange,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Text(
                'In transit',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.2,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6E747F),
                ),
              ),
            ),
            Text(
              'Delivered',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.2,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6E747F),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActiveCheckCircle() {
    return Container(
      width: 22,
      height: 22,
      decoration: const BoxDecoration(
        color: AppColors.primaryOrange,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.check_rounded,
        size: 13.5,
        color: Colors.white,
      ),
    );
  }

  Widget _buildCurrentSortingCircle() {
    return Container(
      width: 22,
      height: 22,
      decoration: const BoxDecoration(
        color: AppColors.primaryOrange,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 6.5,
        height: 6.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildInactiveCircle() {
    return Container(
      width: 22,
      height: 22,
      decoration: const BoxDecoration(
        color: Color(0xFFEDEFF2),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 5.5,
        height: 5.5,
        decoration: const BoxDecoration(
          color: AppColors.timelineInactiveDot,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

