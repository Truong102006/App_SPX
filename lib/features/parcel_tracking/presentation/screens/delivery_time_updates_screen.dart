import '../../../../core/widgets/spx_interactive.dart';
import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';
import '../../../../data/models/parcel_sample_data.dart';

/// Screen 03/06: "Delivery time and status updates" (Two Different Timeframes)
class DeliveryTimeUpdatesScreen extends StatelessWidget {
  final ParcelOrderData? selectedOrder;
  final VoidCallback? onDelayedParcelSupport;
  final VoidCallback? onReviewParcelDetails;
  final VoidCallback? onBackTap;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const DeliveryTimeUpdatesScreen({
    super.key,
    this.selectedOrder,
    this.onDelayedParcelSupport,
    this.onReviewParcelDetails,
    this.onBackTap,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final order = selectedOrder ?? ParcelTrackingSampleData.sampleOrders.first;

    return IphoneMockupFrame(
      timeText: '14:30',
      activeTab: SpxBottomTab.parcels,
      onBackTap: onBackTap,
      onTabSelected: onTabSelected,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpxSectionEyebrow(
              title: 'TWO DIFFERENT TIMEFRAMES',
              stepText: '03 / 06',
            ),
            const SizedBox(height: 6),
            const LocalizedText(
              'Delivery time and\nstatus updates',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 7),
            LocalizedText(
              order.trackingId,
              style: const TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 12.8,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B717C),
              ),
            ),
            const SizedBox(height: 12),

            // Card 1: Estimated Delivery Time (White with thin orange border)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFD66A3F),
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LocalizedText(
                    'Estimated Delivery Time',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.6,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          child: LocalizedText(
                        order.estimatedDelivery,
                        style: const TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 21.5,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.4,
                          color: AppColors.textPrimary,
                        ),
                      )),
                      SpxCustomIcons.calendarIcon(
                        size: 20,
                        color: AppColors.primaryOrange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const LocalizedText(
                    'When your parcel is expected to arrive.\n'
                    'This is an estimate and may change.',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Card 2: Next Status Update (Dark Charcoal Card)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 17),
              decoration: BoxDecoration(
                color: const Color(0xFF202223),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Flexible(
                          child: LocalizedText(
                        'Next Status Update',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 12.8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                      Icon(
                        Icons.access_time_rounded,
                        size: 19,
                        color: Color(0xFFD85B27),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LocalizedText(
                    order.nextUpdate,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 21.5,
                      fontWeight: FontWeight.w700,
                      height: 1.22,
                      letterSpacing: -0.4,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const LocalizedText(
                    'When SPX expects to share a status update.\n'
                    'This is not the delivery time.',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: Color(0xFFC2C6CC),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),

            // Primary Button: Delayed Parcel Support ->
            SpxPrimaryButton(
              label: 'Delayed Parcel Support',
              showArrow: true,
              onTap: onDelayedParcelSupport,
            ),
            const SizedBox(height: 10),

            // Secondary Button with trailing speech bubble icon: Review parcel details
            SpxInteractive(
              onTap: onReviewParcelDetails,
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                        child: LocalizedText(
                      'Review parcel details',
                      style: AppTextStyles.secondaryButton,
                    )),
                    const SizedBox(width: 8),
                    SpxCustomIcons.speechBubble(
                      size: 16.5,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Footer Timezone Info Row
            Row(
              children: const [
                Icon(
                  Icons.info_outline_rounded,
                  size: 15,
                  color: Color(0xFF5D636F),
                ),
                SizedBox(width: 6),
                Flexible(
                    child: LocalizedText(
                  'All times use Vietnam time · ICT (UTC+7).',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 11.2,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B717C),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
