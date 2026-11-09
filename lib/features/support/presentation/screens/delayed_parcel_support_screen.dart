import '../../../../core/widgets/spx_interactive.dart';
import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';
import '../../../../data/models/parcel_sample_data.dart';

/// Screen 04/06: "How can I help you?" (Delayed Parcel Support)
/// Includes red-highlighted delay reason, Submit Support Request navigation to Screen 5,
/// and updated English description under "Request urgent delivery support" for SPX Instant.
class DelayedParcelSupportScreen extends StatefulWidget {
  final VoidCallback? onRequestUrgentSupport;
  final ParcelOrderData? selectedOrder;
  final VoidCallback? onSubmitSupportRequest;
  final VoidCallback? onViewDetailsAndNextUpdate;
  final VoidCallback? onBackTap;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const DelayedParcelSupportScreen({
    super.key,
    this.onRequestUrgentSupport,
    this.selectedOrder,
    this.onSubmitSupportRequest,
    this.onViewDetailsAndNextUpdate,
    this.onBackTap,
    this.onTabSelected,
  });

  @override
  State<DelayedParcelSupportScreen> createState() =>
      _DelayedParcelSupportScreenState();
}

class _DelayedParcelSupportScreenState
    extends State<DelayedParcelSupportScreen> {
  String? _feedbackBannerMessage;
  bool _isUrgentSuccess = false;

  void _showActionFeedback(String message, {bool isUrgent = false}) {
    setState(() {
      _feedbackBannerMessage = message;
      _isUrgentSuccess = isUrgent;
    });
  }

  @override
  Widget build(BuildContext context) {
    final order =
        widget.selectedOrder ?? ParcelTrackingSampleData.sampleOrders.first;

    return IphoneMockupFrame(
      timeText: '14:35',
      activeTab: SpxBottomTab.support,
      onBackTap: widget.onBackTap,
      onTabSelected: widget.onTabSelected,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 15, 18, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpxSectionEyebrow(
              title: 'DELAYED PARCEL SUPPORT',
              stepText: '04 / 06',
            ),
            const SizedBox(height: 5),
            const LocalizedText(
              'How can I help you?',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 11),

            // Top Parcel Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
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
            const SizedBox(height: 11),

            // Check your parcel status Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LocalizedText(
                    'Check your parcel status',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 7),
                  LocalizedText(
                    '${order.currentHub}\n'
                    'Recorded: ${order.updatedAt}',
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.2,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: Color(0xFF3E434C),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Highlighted Delay Reason in Red
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.delayReasonRedBg,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.delayReasonRedBorder,
                        width: 0.9,
                      ),
                    ),
                    child: LocalizedText(
                      '${order.processingStage} · ${order.delayShortReason}',
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 11.8,
                        fontWeight: FontWeight.w700,
                        color: AppColors.delayReasonRed,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  LocalizedText(
                    'Verified in this sample scenario\n'
                    'Estimated delivery: ${order.estimatedDelivery}',
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.2,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: Color(0xFF3E434C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SpxInteractive(
                    onTap: widget.onViewDetailsAndNextUpdate,
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Flexible(
                            child: LocalizedText(
                          'View details and Next Status Update',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 12.4,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryOrange,
                          ),
                        )),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 13.5,
                          color: AppColors.primaryOrange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Or speak with a support agent section
            const LocalizedText(
              'Or speak with a support agent',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),

            SpxSecondaryButton(
              label: 'Contact a support agent',
              onTap: () => _showActionFeedback(
                'Connecting to live SPX Support Agent for ${order.trackingId}...',
              ),
            ),
            const SizedBox(height: 7),
            SpxSecondaryButton(
              label: 'Request a callback',
              onTap: () => _showActionFeedback(
                'Callback scheduled! An SPX specialist will call you within 15 minutes.',
              ),
            ),
            const SizedBox(height: 7),
            // Primary Orange Button -> Navigates normally to Screen 5 (Confirm Request Modal)
            SpxPrimaryButton(
              label: 'Submit Support Request',
              showArrow: true,
              onTap: widget.onSubmitSupportRequest,
            ),
            const SizedBox(height: 11),

            // Interactive feedback banner when secondary or urgent actions are tapped
            if (_feedbackBannerMessage != null) ...[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                decoration: BoxDecoration(
                  color: _isUrgentSuccess
                      ? AppColors.greenCardBg
                      : AppColors.peachAlertBg,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: _isUrgentSuccess
                        ? AppColors.greenText.withValues(alpha: 0.3)
                        : AppColors.primaryOrange.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      _isUrgentSuccess
                          ? Icons.bolt_rounded
                          : Icons.info_outline_rounded,
                      size: 16,
                      color: _isUrgentSuccess
                          ? AppColors.greenText
                          : AppColors.primaryOrange,
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: LocalizedText(
                        _feedbackBannerMessage!,
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 11.3,
                          fontWeight: FontWeight.w600,
                          height: 1.35,
                          color: _isUrgentSuccess
                              ? AppColors.greenText
                              : AppColors.textAlertBrown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Request urgent delivery support link + SPX Instant (Hỏa tốc) Eligibility Description
            SpxInteractive(
              onTap: widget.onRequestUrgentSupport,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: order.isUrgentEligible
                        ? AppColors.primaryOrange
                        : AppColors.borderLight,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.bolt_rounded,
                              size: 16,
                              color: AppColors.primaryOrange,
                            ),
                            SizedBox(width: 4),
                            Flexible(
                                child: LocalizedText(
                              'Request urgent delivery support',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 12.4,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryOrange,
                              ),
                            )),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 13.5,
                              color: AppColors.primaryOrange,
                            ),
                          ],
                        )),
                        if (order.isUrgentEligible)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.greenBadgeBg,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const LocalizedText(
                              'ELIGIBLE',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 8.8,
                                fontWeight: FontWeight.w800,
                                color: AppColors.greenText,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const LocalizedText(
                      'Only supported when your parcel has reached your local area hub for 1–2 days without delivery or status updates; your parcel will be delivered via SPX Instant (Express).',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 11.2,
                        fontWeight: FontWeight.w500,
                        height: 1.38,
                        color: Color(0xFF5D636F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
