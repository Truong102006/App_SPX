import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../data/models/parcel_sample_data.dart';

/// Screen Modal: "Submit Support Request?" (Confirm Request - Sample Data)
class ConfirmSupportRequestScreen extends StatelessWidget {
  final bool isExpress;
  final ParcelOrderData? selectedOrder;
  final VoidCallback? onConfirmAndSubmit;
  final VoidCallback? onGoBackWithoutSubmitting;

  const ConfirmSupportRequestScreen({
    super.key,
    this.isExpress = false,
    this.selectedOrder,
    this.onConfirmAndSubmit,
    this.onGoBackWithoutSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    final order = selectedOrder ?? ParcelTrackingSampleData.sampleOrders.first;

    return IphoneMockupFrame(
      timeText: '14:35',
      onBackTap: onGoBackWithoutSubmitting,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocalizedText(
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
              const LocalizedText(
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
              const LocalizedText(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocalizedText(
                      order.trackingId,
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    LocalizedText(
                      order.currentHub,
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 12.6,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LocalizedText(
                      'Destination: ${order.destination}',
                      style: const TextStyle(
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
              if (isExpress) ...[
                const LocalizedText('Delivery service: SPX Instant (Express)',
                    style: TextStyle(
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
              ],
              SpxPrimaryButton(
                label: 'Confirm and submit',
                showArrow: true,
                onTap: onConfirmAndSubmit,
              ),
              const SizedBox(height: 10),

              // Go back without submitting button
              SpxSecondaryButton(
                label: 'Go back without submitting',
                onTap: onGoBackWithoutSubmitting,
              ),
              const SizedBox(height: 15),

              const LocalizedText(
                'Once submitted, track it under Support Request.',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.4,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6A707B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
