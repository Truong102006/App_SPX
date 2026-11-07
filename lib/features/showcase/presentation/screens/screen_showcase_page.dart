import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../parcel_tracking/presentation/screens/parcel_delayed_screen.dart';
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
  // -1 means "Show All 5 Screens Side-by-Side", 0..4 means single screen focus
  int _selectedIndex = -1;

  static const List<_ScreenItem> _screens = [
    _ScreenItem(
      title: '1. Parcel Tracking (01/06)',
      subtitle: 'Your parcel may be delayed',
      widget: ParcelDelayedScreen(),
    ),
    _ScreenItem(
      title: '2. Delayed Support (04/06)',
      subtitle: 'How can I help you?',
      widget: DelayedParcelSupportScreen(),
    ),
    _ScreenItem(
      title: '3. Confirm Request Modal',
      subtitle: 'Submit Support Request?',
      widget: ConfirmSupportRequestScreen(),
    ),
    _ScreenItem(
      title: '4. Track Request (05/06)',
      subtitle: 'Track Support Request',
      widget: TrackSupportRequestScreen(),
    ),
    _ScreenItem(
      title: '5. Resolution Update (06/06)',
      subtitle: 'Left the sorting hub',
      widget: ResolutionUpdateScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        'SPX ',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColors.logoOrange,
                        ),
                      ),
                      Text(
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
                    label: 'All 5 Screens (100% Reference View)',
                    selected: _selectedIndex == -1,
                    onTap: () => setState(() => _selectedIndex = -1),
                  ),
                  const SizedBox(width: 8),
                  for (int i = 0; i < _screens.length; i++) ...[
                    _buildFilterChip(
                      label: _screens[i].title,
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
                ? _buildAllScreensCanvas()
                : _buildSingleScreenCanvas(_screens[_selectedIndex]),
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
    return GestureDetector(
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
        child: Text(
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

  Widget _buildAllScreensCanvas() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      child: Center(
        child: Wrap(
          spacing: 28,
          runSpacing: 32,
          alignment: WrapAlignment.center,
          children: _screens.map((item) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                item.widget,
                const SizedBox(height: 10),
                Text(
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
