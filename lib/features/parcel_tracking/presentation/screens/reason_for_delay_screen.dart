import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';
import '../../../../data/models/parcel_sample_data.dart';

/// Screen 02/06: "Why is my parcel delayed?" (Reason For The Delay)
/// Highlights the delay reason in red and supports dynamic selected order data.
class ReasonForDelayScreen extends StatelessWidget {
  final ParcelOrderData? selectedOrder;
  final VoidCallback? onViewUpdateTime;
  final VoidCallback? onBackTap;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const ReasonForDelayScreen({
    super.key,
    this.selectedOrder,
    this.onViewUpdateTime,
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
              title: 'REASON FOR THE DELAY',
              stepText: '02 / 06',
            ),
            const SizedBox(height: 6),
            const LocalizedText(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocalizedText(
                          order.trackingId,
                          style: const TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        LocalizedText(
                          'To ${order.destination}',
                          style: const TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 11.4,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B717C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const LocalizedText(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                        const LocalizedText(
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocalizedText(
                              order.currentHub,
                              style: const TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 3),
                            LocalizedText(
                              'Processing stage: ${order.processingStage}',
                              style: const TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 12.2,
                                fontWeight: FontWeight.w500,
                                color: AppColors.delayReasonRed,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Main Backlog Explanation Highlighted in RED
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.delayReasonRedBg,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppColors.delayReasonRedBorder,
                        width: 1.1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.warning_amber_rounded,
                              size: 16,
                              color: AppColors.delayReasonRed,
                            ),
                            SizedBox(width: 5),
                            Flexible(
                                child: LocalizedText(
                              'DELAY REASON (HIGHLIGHTED)',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 10.2,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.4,
                                color: AppColors.delayReasonRed,
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(height: 6),
                        LocalizedText(
                          order.delayDetailedReason,
                          style: const TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            height: 1.38,
                            color: AppColors.delayReasonRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Thin Divider
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFFECEEF1),
                  ),
                  const SizedBox(height: 12),

                  // Verified Timestamp & Disclaimer
                  LocalizedText(
                    'Verified: ${order.updatedAt}',
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const LocalizedText(
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
                  child: LocalizedText(
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
            SpxPrimaryButton(
              label: 'View update time',
              showArrow: true,
              onTap: onViewUpdateTime,
            ),
            const SizedBox(height: 12),

            // Centered Footer Note
            const Center(
              child: LocalizedText(
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
