import 'spx_interactive.dart';
import '../../core/localization/app_language.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'spx_custom_icons.dart';

enum SpxBottomTab { home, parcels, support, account }

/// Exact iPhone 13/14 Pro mockup frame matching the 5 reference screenshots 100%,
/// including the metallic dark bezel, status bar, notch, SPX Express header,
/// student project sample banner, and bottom navigation bar with home indicator.
class IphoneMockupFrame extends StatelessWidget {
  final String timeText;
  final Widget body;
  final SpxBottomTab? activeTab;
  final bool showStandardShell;
  final bool showStatusBar;
  final VoidCallback? onBackTap;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const IphoneMockupFrame({
    super.key,
    required this.timeText,
    required this.body,
    this.activeTab,
    this.showStandardShell = true,
    this.showStatusBar = false,
    this.onBackTap,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392,
      height: 822,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2227),
        borderRadius: BorderRadius.circular(56),
        border: Border.all(
          color: const Color(0xFF5A606B),
          width: 3.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 30,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      padding: const EdgeInsets.all(11),
      child: Container(
        decoration: BoxDecoration(
          color: showStandardShell ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(45),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            if (showStandardShell)
              Column(
                children: [
                  SpxIosStatusBar(timeText: timeText),
                  _SpxAppBar(onBackTap: onBackTap),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: AppColors.screenBg,
                      child: body,
                    ),
                  ),
                  if (activeTab != null)
                    _SpxBottomNavBar(
                      activeTab: activeTab!,
                      onTabSelected: onTabSelected,
                    ),
                ],
              )
            else if (showStatusBar)
              Column(
                children: [
                  SpxIosStatusBar(timeText: timeText),
                  Expanded(child: body),
                ],
              )
            else
              body,

            // Top iPhone Notch Overlay
            Align(
              alignment: Alignment.topCenter,
              child: _IphoneNotch(),
            ),
          ],
        ),
      ),
    );
  }
}

class _IphoneNotch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 22),
          Container(
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF121829),
              border: Border.all(
                color: const Color(0xFF232C42),
                width: 2,
              ),
            ),
            child: Center(
              child: Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2D4B82),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class SpxIosStatusBar extends StatelessWidget {
  final String timeText;
  final Color foregroundColor;
  final Color backgroundColor;

  const SpxIosStatusBar(
      {super.key,
      required this.timeText,
      this.foregroundColor = Colors.black,
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: LocalizedText(
              timeText,
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: foregroundColor,
                letterSpacing: -0.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                // Cellular signal bars
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _bar(3.5),
                    const SizedBox(width: 1.5),
                    _bar(5.5),
                    const SizedBox(width: 1.5),
                    _bar(8.0),
                    const SizedBox(width: 1.5),
                    _bar(10.5, active: false),
                  ],
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.wifi_rounded,
                  size: 15.5,
                  color: foregroundColor,
                ),
                const SizedBox(width: 6),
                // Battery icon
                Row(
                  children: [
                    Container(
                      width: 21,
                      height: 10.5,
                      padding: const EdgeInsets.all(1.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: foregroundColor.withValues(alpha: 0.45),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: foregroundColor,
                          borderRadius: BorderRadius.circular(1.2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 1),
                    Container(
                      width: 1.5,
                      height: 4,
                      decoration: BoxDecoration(
                        color: foregroundColor.withValues(alpha: 0.45),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(1),
                          bottomRight: Radius.circular(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar(double height, {bool active = true}) {
    return Container(
      width: 2.7,
      height: height,
      decoration: BoxDecoration(
        color:
            active ? foregroundColor : foregroundColor.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}

class _SpxAppBar extends StatelessWidget {
  final VoidCallback? onBackTap;

  const _SpxAppBar({this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SpxInteractive(
            onTap: onBackTap,
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'SPX ',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 18.5,
                    fontWeight: FontWeight.w900,
                    color: AppColors.logoOrange,
                    letterSpacing: -0.3,
                  ),
                ),
                TextSpan(
                  text: 'Express',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
          SpxInteractive(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: LocalizedText('SPX Express'),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.more_horiz_rounded,
                size: 21,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpxBottomNavBar extends StatelessWidget {
  final SpxBottomTab activeTab;
  final ValueChanged<SpxBottomTab>? onTabSelected;

  const _SpxBottomNavBar({
    required this.activeTab,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 8, bottom: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildItem(
                label: 'Home',
                tab: SpxBottomTab.home,
                isActive: activeTab == SpxBottomTab.home,
                iconBuilder: (color) =>
                    SpxCustomIcons.homeIcon(size: 21, color: color),
              ),
              _buildItem(
                label: 'Parcels',
                tab: SpxBottomTab.parcels,
                isActive: activeTab == SpxBottomTab.parcels,
                iconBuilder: (color) =>
                    SpxCustomIcons.parcelSearch(size: 22, color: color),
              ),
              _buildItem(
                label: 'Support',
                tab: SpxBottomTab.support,
                isActive: activeTab == SpxBottomTab.support,
                iconBuilder: (color) =>
                    SpxCustomIcons.supportHeadset(size: 21, color: color),
              ),
              _buildItem(
                label: 'Account',
                tab: SpxBottomTab.account,
                isActive: activeTab == SpxBottomTab.account,
                iconBuilder: (color) =>
                    SpxCustomIcons.accountIcon(size: 21, color: color),
              ),
            ],
          ),
          const SizedBox(height: 11),
          // Home Indicator Pill
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

  Widget _buildItem({
    required String label,
    required SpxBottomTab tab,
    required bool isActive,
    required Widget Function(Color color) iconBuilder,
  }) {
    final color = isActive ? AppColors.primaryOrange : AppColors.navInactive;
    return SpxInteractive(
      onTap: tab != SpxBottomTab.home && onTabSelected != null
          ? () => onTabSelected!(tab)
          : null,
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
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
