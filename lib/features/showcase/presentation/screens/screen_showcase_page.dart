import '../../../../core/widgets/spx_interactive.dart';
import '../../../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/iphone_mockup_frame.dart';
import '../../../../data/models/parcel_sample_data.dart';
import '../../../account/presentation/screens/account_utilities_screen.dart';
import '../../../account/presentation/screens/demo_vouchers.dart';
import '../../../parcel_tracking/presentation/screens/delivery_time_updates_screen.dart';
import '../../../parcel_tracking/presentation/screens/parcel_delayed_screen.dart';
import '../../../parcel_tracking/presentation/screens/reason_for_delay_screen.dart';
import '../../../resolution/presentation/screens/resolution_update_screen.dart';
import '../../../support/presentation/screens/confirm_support_request_screen.dart';
import '../../../support/presentation/screens/delayed_parcel_support_screen.dart';
import '../../../support/presentation/screens/track_support_request_screen.dart';

class ScreenShowcasePage extends StatefulWidget {
  const ScreenShowcasePage({super.key});

  @override
  State<ScreenShowcasePage> createState() => _ScreenShowcasePageState();
}

class _ScreenShowcasePageState extends State<ScreenShowcasePage> {
  // -1 means "Show All 8 Screens Side-by-Side", 0..7 means single screen focus
  int _selectedIndex = -1;
  bool _isExpress = false;
  bool _showVoucherOffer = false;
  DemoVoucher? _receivedVoucher;
  final List<DemoVoucher> _vouchers = [
    DemoVoucher(
        code: 'DEMO-SHOPEE-10', shopee: true, receivedAt: DateTime.now()),
    DemoVoucher(
        code: 'DEMO-SPX-30K', shopee: false, receivedAt: DateTime.now()),
  ];

  void _startSupport(bool express) {
    setState(() {
      _isExpress = express;
      _showVoucherOffer = false;
      _receivedVoucher = null;
      _selectedIndex = 5;
    });
  }

  void _submitSupport() {
    setState(() {
      _selectedIndex = 6;
      _showVoucherOffer = true;
      _receivedVoucher = null;
    });
  }

  void _claimVoucher(bool shopee) {
    if (!_showVoucherOffer || _receivedVoucher != null) return;
    setState(() {
      final voucher = DemoVoucher(
          code: 'DEMO-${shopee ? 'SHOPEE' : 'SPX'}-${_vouchers.length + 1}',
          shopee: shopee,
          receivedAt: DateTime.now(),
          trackingId: _selectedOrder.trackingId);
      _vouchers.add(voucher);
      _receivedVoucher = voucher;
    });
  }

  ParcelOrderData _selectedOrder = ParcelTrackingSampleData.sampleOrders.first;

  void _navigateToScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleBottomTabTap(SpxBottomTab tab) {
    switch (tab) {
      case SpxBottomTab.home:
        return;
      case SpxBottomTab.account:
        _navigateToScreen(0); // Account & Utilities (Image 1)
        break;
      case SpxBottomTab.parcels:
        _navigateToScreen(1); // Parcel Tracking (01/06)
        break;
      case SpxBottomTab.support:
        _navigateToScreen(4); // Delayed Support (04/06)
        break;
    }
  }

  List<_ScreenItem> _buildScreens() {
    return [
      _ScreenItem(
        title: '0. Account & Utilities',
        subtitle: 'Pending Orders & Delayed Support',
        widget: AccountUtilitiesScreen(
          vouchers: _vouchers,
          selectedOrder: _selectedOrder,
          onOpenParcelTracking: () => _navigateToScreen(1),
          onOpenSupportCenter: () => _navigateToScreen(4),
          onSelectOrder: (order) {
            setState(() {
              _selectedOrder = order;
              _selectedIndex = 1;
            });
          },
          onTabSelected: _handleBottomTabTap,
        ),
      ),
      _ScreenItem(
        title: '1. Parcel Tracking (01/06)',
        subtitle: 'Your parcel may be delayed',
        widget: ParcelDelayedScreen(
          selectedOrder: _selectedOrder,
          onOrderChanged: (order) {
            setState(() {
              _selectedOrder = order;
            });
          },
          onViewDetails: () => _navigateToScreen(2),
          onBackTap: () => _navigateToScreen(0),
          onTabSelected: _handleBottomTabTap,
        ),
      ),
      _ScreenItem(
        title: '2. Reason for Delay (02/06)',
        subtitle: 'Why is my parcel delayed?',
        widget: ReasonForDelayScreen(
          selectedOrder: _selectedOrder,
          onViewUpdateTime: () => _navigateToScreen(3),
          onBackTap: () => _navigateToScreen(1),
          onTabSelected: _handleBottomTabTap,
        ),
      ),
      _ScreenItem(
        title: '3. Delivery Timeframes (03/06)',
        subtitle: 'Delivery time and status updates',
        widget: DeliveryTimeUpdatesScreen(
          selectedOrder: _selectedOrder,
          onDelayedParcelSupport: () => _navigateToScreen(4),
          onReviewParcelDetails: () => _navigateToScreen(2),
          onBackTap: () => _navigateToScreen(2),
          onTabSelected: _handleBottomTabTap,
        ),
      ),
      _ScreenItem(
        title: '4. Delayed Support (04/06)',
        subtitle: 'How can I help you?',
        widget: DelayedParcelSupportScreen(
          selectedOrder: _selectedOrder,
          onSubmitSupportRequest: () => _startSupport(false),
          onRequestUrgentSupport: () => _startSupport(true),
          onViewDetailsAndNextUpdate: () => _navigateToScreen(3),
          onBackTap: () => _navigateToScreen(3),
          onTabSelected: _handleBottomTabTap,
        ),
      ),
      _ScreenItem(
        title: '5. Confirm Request Modal',
        subtitle: 'Submit Support Request?',
        widget: ConfirmSupportRequestScreen(
          isExpress: _isExpress,
          selectedOrder: _selectedOrder,
          onConfirmAndSubmit: _submitSupport,
          onGoBackWithoutSubmitting: () => _navigateToScreen(4),
        ),
      ),
      _ScreenItem(
        title: '6. Track Request (05/06)',
        subtitle: 'Track Support Request',
        widget: TrackSupportRequestScreen(
          isExpress: _isExpress,
          voucherOverlay: _showVoucherOffer
              ? DemoVoucherPanel(
                  received: _receivedVoucher,
                  onChoose: _claimVoucher,
                  onClose: () => setState(() => _showVoucherOffer = false),
                )
              : null,
          selectedOrder: _selectedOrder,
          onViewResolutionUpdate: () => _navigateToScreen(7),
          onBackTap: () => _navigateToScreen(4),
          onTabSelected: _handleBottomTabTap,
        ),
      ),
      _ScreenItem(
        title: '7. Resolution Update (06/06)',
        subtitle: 'Left the sorting hub',
        widget: ResolutionUpdateScreen(
          selectedOrder: _selectedOrder,
          onBackToParcelTracking: () => _navigateToScreen(1),
          onContactSupportAgain: () => _navigateToScreen(4),
          onBackTap: () => _navigateToScreen(6),
          onTabSelected: _handleBottomTabTap,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screens = _buildScreens();

    return Scaffold(
      backgroundColor: const Color(0xFF434446),
      body: Column(
        children: [
          // Top Studio Selector Bar
          Container(
            width: double.infinity,
            color: const Color(0xFF2B2C2E),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: const [
                      LocalizedText(
                        'SPX ',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColors.logoOrange,
                        ),
                      ),
                      LocalizedText(
                        'Express UI Showcase',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  _buildFilterChip(
                    label: 'All 8 Screens (Account + 01/06 → 06/06)',
                    selected: _selectedIndex == -1,
                    onTap: () => setState(() => _selectedIndex = -1),
                  ),
                  const SizedBox(width: 8),
                  for (int i = 0; i < screens.length; i++) ...[
                    _buildFilterChip(
                      label: screens[i].title,
                      selected: _selectedIndex == i,
                      onTap: () => setState(() => _selectedIndex = i),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
          ),

          // Main Viewport
          Expanded(
            child: _selectedIndex == -1
                ? _buildAllScreensCanvas(screens)
                : _buildSingleScreenCanvas(screens[_selectedIndex]),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return SpxInteractive(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryOrange : const Color(0xFF3A3C3F),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? AppColors.logoOrange : const Color(0xFF52555A),
            width: 1,
          ),
        ),
        child: LocalizedText(
          label,
          style: TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 12.5,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAllScreensCanvas(List<_ScreenItem> screens) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      child: Center(
        child: Wrap(
          spacing: 28,
          runSpacing: 32,
          alignment: WrapAlignment.center,
          children: screens.map((item) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                item.widget,
                const SizedBox(height: 10),
                LocalizedText(
                  item.title,
                  style: const TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSingleScreenCanvas(_ScreenItem item) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: item.widget,
      ),
    );
  }
}

class _ScreenItem {
  final String title;
  final String subtitle;
  final Widget widget;

  const _ScreenItem({
    required this.title,
    required this.subtitle,
    required this.widget,
  });
}
