import '../../../../core/widgets/spx_interactive.dart';
import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_common_widgets.dart';
import '../../../../core/widgets/spx_custom_icons.dart';
import '../../../../data/models/parcel_sample_data.dart';

/// Screen 01/06: "Your parcel may be delayed" (Parcel Tracking)
/// Includes Tracking ID lookup bar + quick filter chips for existing sample orders,
/// red-highlighted delay reason, and interactive navigation.
class ParcelDelayedScreen extends StatefulWidget {
  final ParcelOrderData? selectedOrder;
  final ValueChanged<ParcelOrderData>? onOrderChanged;
  final VoidCallback? onViewDetails;
  final VoidCallback? onBackTap;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const ParcelDelayedScreen({
    super.key,
    this.selectedOrder,
    this.onOrderChanged,
    this.onViewDetails,
    this.onBackTap,
    this.onTabSelected,
  });

  @override
  State<ParcelDelayedScreen> createState() => _ParcelDelayedScreenState();
}

class _ParcelDelayedScreenState extends State<ParcelDelayedScreen> {
  late ParcelOrderData _currentOrder;
  late TextEditingController _searchController;
  bool _showFilterDropdown = false;

  @override
  void initState() {
    super.initState();
    _currentOrder =
        widget.selectedOrder ?? ParcelTrackingSampleData.sampleOrders.first;
    _searchController = TextEditingController(text: _currentOrder.trackingId);
  }

  @override
  void didUpdateWidget(covariant ParcelDelayedScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedOrder != null &&
        widget.selectedOrder!.trackingId != _currentOrder.trackingId) {
      _currentOrder = widget.selectedOrder!;
      _searchController.text = _currentOrder.trackingId;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _selectOrder(ParcelOrderData order) {
    setState(() {
      _currentOrder = order;
      _searchController.text = order.trackingId;
      _showFilterDropdown = false;
    });
    widget.onOrderChanged?.call(order);
  }

  void _handleSearchSubmitted(String query) {
    final trimmed = query.trim().toUpperCase();
    if (trimmed.isEmpty) return;

    final matches = ParcelTrackingSampleData.sampleOrders.where(
      (o) =>
          o.trackingId.toUpperCase().contains(trimmed) ||
          o.itemName.toUpperCase().contains(trimmed),
    );
    if (matches.isNotEmpty) {
      _selectOrder(matches.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    final allOrders = ParcelTrackingSampleData.sampleOrders;

    return IphoneMockupFrame(
      timeText: '14:30',
      activeTab: SpxBottomTab.parcels,
      onBackTap: widget.onBackTap,
      onTabSelected: widget.onTabSelected,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpxSectionEyebrow(
              title: 'PARCEL TRACKING',
              stepText: '01 / 06',
            ),
            const SizedBox(height: 5),
            const LocalizedText(
              'Your parcel may be delayed',
              style: AppTextStyles.pageTitle,
            ),
            const SizedBox(height: 10),

            // Search & Filter Tracking ID Box
            _buildTrackingSearchAndFilterBox(allOrders),
            const SizedBox(height: 10),

            // Tracking ID Row with Copy icon
            SpxInteractive(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: LocalizedText(
                        'Copied tracking ID: ${_currentOrder.trackingId}'),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LocalizedText(
                      '${_currentOrder.trackingId} · ${_currentOrder.itemName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 12.6,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5A606A),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SpxCustomIcons.copyIcon(size: 16),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Peach Delay Alert Box with RED highlighted delay reason
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 13, 14, 14),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LocalizedText(
                          'Your parcel may arrive later than\nexpected.',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            height: 1.28,
                            color: AppColors.textAlertBrown,
                          ),
                        ),
                        const SizedBox(height: 7),
                        // Red Highlighted Delay Reason Pill/Box
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.delayReasonRedBg,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.delayReasonRedBorder,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 1.5),
                                child: Icon(
                                  Icons.error_outline_rounded,
                                  size: 14,
                                  color: AppColors.delayReasonRed,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: LocalizedText(
                                  'Verified reason: ${_currentOrder.delayShortReason}',
                                  style: const TextStyle(
                                    fontFamily: AppTextStyles.fontFamily,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3,
                                    color: AppColors.delayReasonRed,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),

            // Last Recorded Location Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 13, 15, 14),
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
                      LocalizedText(
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
                  const SizedBox(height: 7),
                  LocalizedText(
                    _currentOrder.currentHub,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  LocalizedText(
                    _currentOrder.processingStage,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.6,
                      fontWeight: FontWeight.w500,
                      color: AppColors.delayReasonRed,
                    ),
                  ),
                  const SizedBox(height: 2),
                  LocalizedText(
                    'Updated: ${_currentOrder.updatedAt}',
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.3,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B717C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),

            // View parcel details button
            SpxPrimaryButton(
              label: 'View parcel details',
              showArrow: true,
              onTap: widget.onViewDetails,
            ),
            const SizedBox(height: 11),

            // Delivery Progress Stepper Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 13, 15, 14),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocalizedText(
                    'Delivery progress',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 12),
                  _DeliveryProgressStepper(),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Footer timestamps
            LocalizedText(
              'Next Status Update: ${_currentOrder.nextUpdate.replaceAll('\n', ' ')} ICT.\n'
              'Delay alert: ${_currentOrder.delayAlertTime}',
              style: const TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.2,
                fontWeight: FontWeight.w400,
                height: 1.42,
                color: Color(0xFF6A707B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingSearchAndFilterBox(List<ParcelOrderData> allOrders) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full-width tracking input, with actions on a separate row.
          Row(
            children: [
              const Icon(
                Icons.search_rounded,
                size: 18,
                color: AppColors.primaryOrange,
              ),
              const SizedBox(width: 7),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextField(
                    controller: _searchController,
                    onSubmitted: _handleSearchSubmitted,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 12.3,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: AppLanguageScope.translate(
                          context, 'Enter tracking ID (e.g., 0042, 0189)...'),
                      hintStyle: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8C929C),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SpxInteractive(
                onTap: () => _handleSearchSubmitted(_searchController.text),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const LocalizedText(
                    'Search',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              SpxInteractive(
                onTap: () =>
                    setState(() => _showFilterDropdown = !_showFilterDropdown),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  decoration: BoxDecoration(
                    color: _showFilterDropdown
                        ? AppColors.peachAlertBg
                        : const Color(0xFFF2F3F5),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: _showFilterDropdown
                          ? AppColors.primaryOrange
                          : const Color(0xFFE0E3E8),
                      width: 0.9,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.filter_list_rounded,
                        size: 14,
                        color: _showFilterDropdown
                            ? AppColors.primaryOrange
                            : AppColors.textPrimary,
                      ),
                      const SizedBox(width: 3),
                      LocalizedText(
                        'Orders',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 10.8,
                          fontWeight: FontWeight.w600,
                          color: _showFilterDropdown
                              ? AppColors.primaryOrange
                              : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          // Horizontal Quick Filter Chips for Sample Orders
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: allOrders.map((order) {
                final isSelected = order.trackingId == _currentOrder.trackingId;
                final shortCode = order.trackingId.split('-').last;
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: SpxInteractive(
                    onTap: () => _selectOrder(order),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryOrange
                            : const Color(0xFFF4F5F7),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryOrange
                              : const Color(0xFFE2E4E9),
                          width: 0.8,
                        ),
                      ),
                      child: LocalizedText(
                        '#$shortCode',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 10.8,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF4E545F),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Expanded Dropdown List if user clicks "Mã đơn" Filter button
          if (_showFilterDropdown) ...[
            const SizedBox(height: 8),
            const Divider(height: 1, color: Color(0xFFECEEF1)),
            const SizedBox(height: 6),
            ...allOrders.map((order) {
              final isSelected = order.trackingId == _currentOrder.trackingId;
              return SpxInteractive(
                onTap: () => _selectOrder(order),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  margin: const EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.peachAlertBg
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked_rounded
                            : Icons.radio_button_off_rounded,
                        size: 15,
                        color: isSelected
                            ? AppColors.primaryOrange
                            : const Color(0xFF8C929C),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocalizedText(
                              order.trackingId,
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w700,
                                color: isSelected
                                    ? AppColors.primaryOrange
                                    : AppColors.textPrimary,
                              ),
                            ),
                            LocalizedText(
                              '${order.itemName} · ${order.currentHub}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 10.5,
                                color: Color(0xFF6B717C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ],
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
            Flexible(
                child: LocalizedText(
              'Picked up',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.2,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6E747F),
              ),
            )),
            Flexible(
                child: Padding(
              padding: EdgeInsets.only(right: 6),
              child: LocalizedText(
                'Sorting',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryOrange,
                ),
              ),
            )),
            Flexible(
                child: Padding(
              padding: EdgeInsets.only(right: 4),
              child: LocalizedText(
                'In transit',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 11.2,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6E747F),
                ),
              ),
            )),
            Flexible(
                child: LocalizedText(
              'Delivered',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11.2,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6E747F),
              ),
            )),
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
