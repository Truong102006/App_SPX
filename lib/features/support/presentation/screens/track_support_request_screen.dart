import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';

/// Screen 05/06: "Track Support Request" (Support Request Progress)
/// Exact 100% pixel match to uploaded image 3 (`media_1794038741841_fd67c81e.png`)
class TrackSupportRequestScreen extends StatelessWidget {
  const TrackSupportRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IphoneMockupFrame(
      timeText: '08:00',
      activeTab: SpxBottomTab.support,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpxSectionEyebrow(
              title: 'SUPPORT REQUEST PROGRESS',
              stepText: '05 / 06',
            ),
            const SizedBox(height: 6),
            const Text(
              'Track Support Request',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 5),
            const Text(
              'This tracks your support request, not delivery progress.',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.8,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B717C),
              ),
            ),
            const SizedBox(height: 11),

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
                      const Text(
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
                  const Text(
                    'SPXVN-DEMO-261102-0042',
                    style: TextStyle(
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
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.peachAlertBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'In transit · Not yet delivered',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 12.6,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textAlertBrown,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Left Sorting Hub – Ho Chi Minh City\n'
                          'Recorded: 08:00, 03/11/2026 ICT',
                          style: TextStyle(
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SUPPORT REQUEST ID',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 10.2,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.45,
                              color: Color(0xFF6B717C),
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'DR-261102-0482',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.closedBadgeBg,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Text(
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
            const SpxPrimaryButton(
              label: 'View Resolution Update',
              showArrow: true,
            ),
            const SizedBox(height: 7),

            const Text(
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
            const SpxSecondaryButton(
              label: 'Request a callback',
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
                Text(
                  'Support case closed; parcel not yet delivered.',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 11.2,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B717C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
                Text(
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
                  Text(
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
