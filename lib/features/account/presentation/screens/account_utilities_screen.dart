import '../../../../core/widgets/spx_interactive.dart';
import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../core/widgets/spx_custom_icons.dart';
import '../../../../data/models/parcel_sample_data.dart';
import 'demo_vouchers.dart';

/// Screen 00: "Account & My Utilities" (English UI matching Image 1 layout)
/// Includes "Pending Orders" (opens sheet with all sample orders & tracking IDs)
/// and "Delayed Parcel Support" right next to it (navigates to Screen 01 Parcel Delayed).
class AccountUtilitiesScreen extends StatefulWidget {
  final List<DemoVoucher> vouchers;
  final ParcelOrderData? selectedOrder;
  final VoidCallback? onOpenParcelTracking;
  final VoidCallback? onOpenSupportCenter;
  final ValueChanged<ParcelOrderData>? onSelectOrder;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const AccountUtilitiesScreen({
    super.key,
    this.vouchers = const [],
    this.selectedOrder,
    this.onOpenParcelTracking,
    this.onOpenSupportCenter,
    this.onSelectOrder,
    this.onTabSelected,
  });

  @override
  State<AccountUtilitiesScreen> createState() => _AccountUtilitiesScreenState();
}

class _AccountUtilitiesScreenState extends State<AccountUtilitiesScreen> {
  bool _showPendingOrdersOverlay = false;
  bool _showLanguageSettings = false;
  bool _showVouchers = false;

  @override
  Widget build(BuildContext context) {
    final orders = ParcelTrackingSampleData.sampleOrders;

    return IphoneMockupFrame(
      timeText: '21:29',
      showStandardShell: false,
      body: Container(
        color: const Color(0xFFF5F6F8),
        child: Stack(
          children: [
            Column(
              children: [
                // Top Orange Banner with Diagonal Yellow Stripes & Status Bar
                _buildTopOrangeHeader(),

                // Scrollable Body with Rank Card, Order Stats, and Utilities Grid
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        _buildMembershipCard(),
                        const SizedBox(height: 10),
                        _buildOrderStatsCard(orders.length),
                        const SizedBox(height: 10),
                        _buildUtilitiesCard(),
                      ],
                    ),
                  ),
                ),

                // Synchronized 4-Tab Bottom Navigation Bar (Home, Parcels, Support, Account)
                _buildSynchronizedBottomNav(),
              ],
            ),

            // "Pending Orders" Modal Overlay inside the Phone Mockup
            if (_showPendingOrdersOverlay) _buildPendingOrdersOverlay(orders),
            if (_showLanguageSettings) _buildLanguageSettings(),
            if (_showVouchers)
              DemoVoucherPanel(
                  wallet: widget.vouchers,
                  onClose: () => setState(() => _showVouchers = false)),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSettings() {
    final scope = AppLanguageScope.maybeOf(context);
    final selected = scope?.language ?? AppLanguage.english;
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(() => _showLanguageSettings = false),
              child: Container(color: Colors.black54),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, right: 4),
                      child: Row(children: [
                        const Expanded(
                            child: LocalizedText('Settings',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700))),
                        IconButton(
                          tooltip: AppLanguageScope.translate(context, 'Close'),
                          onPressed: () =>
                              setState(() => _showLanguageSettings = false),
                          icon: const Icon(Icons.close),
                        ),
                      ]),
                    ),
                    const ListTile(title: LocalizedText('Language')),
                    for (final language in AppLanguage.values)
                      ListTile(
                        key: ValueKey('language-${language.name}'),
                        title: Text(language == AppLanguage.english
                            ? 'English'
                            : 'Tiếng Việt'),
                        selected: selected == language,
                        selectedColor: AppColors.primaryOrange,
                        trailing: selected == language
                            ? const Icon(Icons.check,
                                color: AppColors.primaryOrange)
                            : null,
                        onTap: () {
                          scope?.onChanged(language);
                          setState(() => _showLanguageSettings = false);
                        },
                      ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopOrangeHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFEE4D2D), Color(0xFFFF6633)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Yellow diagonal stripes at top-left matching Image 1
          Positioned(
            top: 38,
            left: -10,
            child: CustomPaint(
              size: const Size(220, 40),
              painter: _DiagonalStripesPainter(),
            ),
          ),
          Column(
            children: [
              const SpxIosStatusBar(
                timeText: '21:29',
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),

              // Top Action Row (Settings Hex & Bell Icon)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      key: const ValueKey('language-settings'),
                      tooltip: AppLanguageScope.translate(context, 'Settings'),
                      onPressed: () =>
                          setState(() => _showLanguageSettings = true),
                      icon: const Icon(Icons.hexagon_outlined,
                          color: Colors.white, size: 22),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 44, minHeight: 44),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.notifications_none_rounded,
                        color: Colors.white, size: 23),
                  ],
                ),
              ),

              // User Avatar & Phone Mask "**2715"
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 18),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.person_outline_rounded,
                        size: 28,
                        color: Color(0xFFEE4D2D),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: LocalizedText(
                        '**2715',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left: Tier / Member
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6E3D4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const LocalizedText(
                    'SPX',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 9.5,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFD67A40),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText(
                        'Tier',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 2),
                      LocalizedText(
                        'Member',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 11.5,
                          color: Color(0xFF8C929C),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: Color(0xFF9EA4AE),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFFECEEF1),
          ),
          // Right: My Points
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFC72C),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const LocalizedText(
                    'X',
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFD97706),
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText(
                        'My Points',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 2),
                      LocalizedText(
                        '0 Points',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 11.5,
                          color: Color(0xFF8C929C),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: Color(0xFF9EA4AE),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatsCard(int pendingCount) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 14, 15, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LocalizedText(
                'Order Statistics',
                style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: Color(0xFF8C929C),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const LocalizedText(
            'Data from the last 7 days',
            style: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: 11.5,
              color: Color(0xFF8C929C),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCounter(
                  '$pendingCount',
                  'Processing',
                  highlight: true,
                ),
              ),
              Expanded(
                child: _buildStatCounter('0', 'Completed'),
              ),
              Expanded(
                child: _buildStatCounter('0', 'Exceptions/Other'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCounter(String count, String label,
      {bool highlight = false}) {
    return Column(
      children: [
        LocalizedText(
          count,
          style: TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: highlight ? const Color(0xFFEE4D2D) : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 5),
        LocalizedText(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 11.2,
            color: Color(0xFF8C929C),
          ),
        ),
      ],
    );
  }

  Widget _buildUtilitiesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 14, 15, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LocalizedText(
            'My Utilities',
            style: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          // Row 1: Pending Orders | Delayed Parcel Support (NEW!) | My Vouchers
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.assignment_late_outlined,
                  label: 'Pending\nOrders',
                  badgeText: '${ParcelTrackingSampleData.sampleOrders.length}',
                  onTap: () => setState(() => _showPendingOrdersOverlay = true),
                ),
              ),
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.support_agent_rounded,
                  label: 'Delayed Parcel\nSupport',
                  isHighlightedNew: true,
                  badgeText: 'NEW',
                  onTap: widget.onOpenParcelTracking,
                ),
              ),
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.confirmation_number_outlined,
                  label: 'My Promo\nCodes',
                  onTap: () => setState(() => _showVouchers = true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Row 2: Print Waybill | Product List | Order Settings
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.print_outlined,
                  label: 'Print\nWaybill',
                ),
              ),
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.shopping_bag_outlined,
                  label: 'Product\nList',
                ),
              ),
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.description_outlined,
                  label: 'Order\nSettings',
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Row 3: Address Book | Staff Management | Help Center
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.contact_mail_outlined,
                  label: 'Address\nBook',
                ),
              ),
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.badge_outlined,
                  label: 'Staff\nManagement',
                ),
              ),
              Expanded(
                child: _buildUtilityItem(
                  icon: Icons.help_outline_rounded,
                  label: 'Support\nCenter',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUtilityItem({
    required IconData icon,
    required String label,
    bool isHighlightedNew = false,
    String? badgeText,
    VoidCallback? onTap,
  }) {
    return SpxInteractive(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: isHighlightedNew
                      ? const Color(0xFFFFF1EC)
                      : const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(12),
                  border: isHighlightedNew
                      ? Border.all(color: const Color(0xFFEE4D2D), width: 1.2)
                      : null,
                ),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Icon(
                      icon,
                      size: 24,
                      color: isHighlightedNew
                          ? const Color(0xFFEE4D2D)
                          : const Color(0xFF3A414E),
                    ),
                    // Tiny orange accent dot matching SPX two-tone icons in Image 1
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEE4D2D),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              if (badgeText != null)
                Positioned(
                  top: -5,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 1.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEE4D2D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: LocalizedText(
                      badgeText,
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 8.5,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 7),
          LocalizedText(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: 11.3,
              fontWeight: isHighlightedNew ? FontWeight.w700 : FontWeight.w500,
              height: 1.25,
              color: isHighlightedNew
                  ? const Color(0xFFEE4D2D)
                  : const Color(0xFF2D323B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingOrdersOverlay(List<ParcelOrderData> orders) {
    final currentSelectedId = widget.selectedOrder?.trackingId;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withValues(alpha: 0.55),
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 640,
        decoration: const BoxDecoration(
          color: Color(0xFFF6F6F7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Modal Header
            Container(
              padding: const EdgeInsets.fromLTRB(18, 16, 14, 13),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LocalizedText(
                          'Pending Orders (Delayed Parcels)',
                          style: TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        LocalizedText(
                          'Select an order to track or request delay support (${orders.length} orders)',
                          style: const TextStyle(
                            fontFamily: AppTextStyles.fontFamily,
                            fontSize: 11.2,
                            color: Color(0xFF6B717C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpxInteractive(
                    onTap: () =>
                        setState(() => _showPendingOrdersOverlay = false),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        size: 18,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE4E6EA)),

            // List of Pending Orders
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(14),
                itemCount: orders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = orders[index];
                  final isCurrent = item.trackingId == currentSelectedId;

                  return SpxInteractive(
                    onTap: () {
                      setState(() => _showPendingOrdersOverlay = false);
                      if (widget.onSelectOrder != null) {
                        widget.onSelectOrder!(item);
                      } else if (widget.onOpenParcelTracking != null) {
                        widget.onOpenParcelTracking!();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: isCurrent
                              ? AppColors.primaryOrange
                              : AppColors.borderLight,
                          width: isCurrent ? 1.4 : 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: LocalizedText(
                                  item.trackingId,
                                  style: const TextStyle(
                                    fontFamily: AppTextStyles.fontFamily,
                                    fontSize: 12.8,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryOrange,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.delayReasonRedBg,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: AppColors.delayReasonRedBorder,
                                    width: 0.8,
                                  ),
                                ),
                                child: LocalizedText(
                                  item.isUrgentEligible
                                      ? 'At local hub (1–2 days)'
                                      : 'Delayed in transit',
                                  style: const TextStyle(
                                    fontFamily: AppTextStyles.fontFamily,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.delayReasonRed,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          LocalizedText(
                            item.itemName,
                            style: const TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 13.2,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          LocalizedText(
                            'Location: ${item.currentHub}\nDestination: ${item.destination}',
                            style: const TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 11.5,
                              height: 1.35,
                              color: Color(0xFF6B717C),
                            ),
                          ),
                          const SizedBox(height: 6),
                          LocalizedText(
                            'Delay reason: ${item.delayShortReason}',
                            style: const TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.delayReasonRed,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.primaryOrange,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            alignment: Alignment.center,
                            child: const LocalizedText(
                              'Track & Support Delayed Parcel →',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 12.2,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Synchronized 4-tab English Bottom Navigation Bar matching the entire SPX Express app:
  /// 1. Home
  /// 2. Parcels -> Navigates to Screen 01/06 Parcel Tracking
  /// 3. Support -> Navigates to Screen 04/06 Delayed Support
  /// 4. Account -> Current active tab
  Widget _buildSynchronizedBottomNav() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 8, bottom: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSyncNavItem(
                label: 'Home',
                active: false,
                iconBuilder: (color) =>
                    SpxCustomIcons.homeIcon(size: 21, color: color),
              ),
              _buildSyncNavItem(
                label: 'Parcels',
                active: false,
                iconBuilder: (color) =>
                    SpxCustomIcons.parcelSearch(size: 22, color: color),
                onTap: () => widget.onTabSelected?.call(SpxBottomTab.parcels),
              ),
              _buildSyncNavItem(
                label: 'Support',
                active: false,
                iconBuilder: (color) =>
                    SpxCustomIcons.supportHeadset(size: 21, color: color),
                onTap: () => widget.onTabSelected?.call(SpxBottomTab.support),
              ),
              _buildSyncNavItem(
                label: 'Account',
                active: true,
                iconBuilder: (color) =>
                    SpxCustomIcons.accountIcon(size: 21, color: color),
                onTap: () => widget.onTabSelected?.call(SpxBottomTab.account),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Container(
            width: 124,
            height: 4.5,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1C20),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncNavItem({
    required String label,
    required bool active,
    required Widget Function(Color color) iconBuilder,
    VoidCallback? onTap,
  }) {
    final color = active ? AppColors.primaryOrange : AppColors.navInactive;
    return SpxInteractive(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 72,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconBuilder(color),
            const SizedBox(height: 3.5),
            LocalizedText(
              label,
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 10.5,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiagonalStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFB800)
      ..style = PaintingStyle.fill;

    // Large left block + 2 diagonal stripes matching Image 1
    final p1 = Path()
      ..moveTo(0, 0)
      ..lineTo(95, 0)
      ..lineTo(68, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(p1, paint);

    final p2 = Path()
      ..moveTo(108, 0)
      ..lineTo(138, 0)
      ..lineTo(111, size.height)
      ..lineTo(81, size.height)
      ..close();
    canvas.drawPath(p2, paint);

    final p3 = Path()
      ..moveTo(151, 0)
      ..lineTo(181, 0)
      ..lineTo(154, size.height)
      ..lineTo(124, size.height)
      ..close();
    canvas.drawPath(p3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
