import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';
import '../../../../data/models/parcel_sample_data.dart';

/// Screen 05/06: "Track Support Request" (Support Request Progress)
class TrackSupportRequestScreen extends StatefulWidget {
  final bool isExpress;
  final Widget? voucherOverlay;
  final ParcelOrderData? selectedOrder;
  final VoidCallback? onViewResolutionUpdate;
  final VoidCallback? onBackTap;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const TrackSupportRequestScreen({
    super.key,
    this.isExpress = false,
    this.voucherOverlay,
    this.selectedOrder,
    this.onViewResolutionUpdate,
    this.onBackTap,
    this.onTabSelected,
  });

  @override
  State<TrackSupportRequestScreen> createState() =>
      _TrackSupportRequestScreenState();
}

class _TrackSupportRequestScreenState extends State<TrackSupportRequestScreen> {
  bool _callbackRequested = false;

  @override
  Widget build(BuildContext context) {
    final order =
        widget.selectedOrder ?? ParcelTrackingSampleData.sampleOrders.first;

    return IphoneMockupFrame(
      timeText: '08:00',
      activeTab: SpxBottomTab.support,
      onBackTap: widget.onBackTap,
      onTabSelected: widget.onTabSelected,
      body: Stack(fit: StackFit.expand, children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpxSectionEyebrow(
                title: 'SUPPORT REQUEST PROGRESS',
                stepText: '05 / 06',
              ),
              const SizedBox(height: 6),
              const LocalizedText(
                'Track Support Request',
                style: AppTextStyles.pageTitle,
              ),
              const SizedBox(height: 5),
              const LocalizedText(
                'This tracks your support request, not delivery progress.',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.8,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B717C),
                ),
              ),
              const SizedBox(height: 11),
              if (widget.isExpress) ...[
                const LocalizedText('Delivery service: SPX Instant (Express)',
                    style: TextStyle(
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 11),
              ],

              // RELATED PARCEL Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(14, 13, 14, 14),
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
                        const LocalizedText(
                          'RELATED PARCEL',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 11.2,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.35,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SpxCustomIcons.paperclip(size: 17),
                      ],
                    ),
                    const SizedBox(height: 4),
                    LocalizedText(
                      order.trackingId,
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 9),
                    // Inner Peach Status Box
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.peachAlertBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LocalizedText(
                            'In transit · Not yet delivered',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 12.6,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textAlertBrown,
                            ),
                          ),
                          const SizedBox(height: 3),
                          LocalizedText(
                            'Left ${order.currentHub}\n'
                            'Recorded: 08:00, 03/11/2026 ICT',
                            style: const TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w400,
                              height: 1.38,
                              color: AppColors.textAlertBody,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11),

              // SUPPORT REQUEST ID Card with Vertical Stepper
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(14, 13, 14, 14),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LocalizedText(
                              'SUPPORT REQUEST ID',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 10.2,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.45,
                                color: Color(0xFF6B717C),
                              ),
                            ),
                            const SizedBox(height: 3),
                            LocalizedText(
                              order.supportRequestId,
                              style: const TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        )),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.closedBadgeBg,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const LocalizedText(
                            'Closed',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.closedBadgeText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Step 1: Request received
                    const _SupportTimelineStep(
                      title: 'Request received',
                      subtitle: '14:36, 02/11/2026 ICT',
                      showBottomLine: true,
                      lineHeight: 14,
                    ),
                    // Step 2: In progress
                    const _SupportTimelineStep(
                      title: 'In progress',
                      showBottomLine: true,
                      lineHeight: 16,
                    ),
                    // Step 3: Awaiting an update
                    const _SupportTimelineStep(
                      title: 'Awaiting an update',
                      showBottomLine: false,
                      bottomSpacing: 8,
                    ),
                    // Step 4: Completed
                    const _SupportTimelineStep(
                      title: 'Completed',
                      subtitle: 'Closed · 08:00, 03/11/2026 ICT',
                      showBottomLine: false,
                      bottomSpacing: 0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11),

              // View Resolution Update button
              SpxPrimaryButton(
                label: 'View Resolution Update',
                showArrow: true,
                onTap: widget.onViewResolutionUpdate,
              ),
              const SizedBox(height: 7),

              const LocalizedText(
                'Support update: 08:00, 03/11/2026 ICT.\n'
                'No further updates: request closed.',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.4,
                  fontWeight: FontWeight.w400,
                  height: 1.38,
                  color: Color(0xFF6B717C),
                ),
              ),
              const SizedBox(height: 8),

              // Request a callback button
              SpxSecondaryButton(
                label: _callbackRequested
                    ? 'Callback requested (within 15m)'
                    : 'Request a callback',
                onTap: () => setState(() => _callbackRequested = true),
              ),
              const SizedBox(height: 9),

              // Info footer row
              Row(
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 14.5,
                    color: Color(0xFF6B717C),
                  ),
                  SizedBox(width: 6),
                  Flexible(
                      child: LocalizedText(
                    'Support case closed; parcel not yet delivered.',
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
        if (widget.voucherOverlay != null) widget.voucherOverlay!,
      ]),
    );
  }
}

class _SupportTimelineStep extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBottomLine;
  final double lineHeight;
  final double bottomSpacing;

  const _SupportTimelineStep({
    required this.title,
    this.subtitle,
    this.showBottomLine = true,
    this.lineHeight = 14,
    this.bottomSpacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.primaryOrange,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.check_rounded,
                size: 13,
                color: Colors.white,
              ),
            ),
            if (showBottomLine)
              Container(
                width: 1.5,
                height: lineHeight,
                margin: const EdgeInsets.symmetric(vertical: 3),
                color: const Color(0xFFD9DCE2),
              )
            else
              SizedBox(height: bottomSpacing),
          ],
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocalizedText(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 13.2,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  LocalizedText(
                    subtitle!,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
