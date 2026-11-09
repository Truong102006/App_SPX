import 'package:flutter/material.dart';
import '../../../../core/localization/app_language.dart';
import '../../../../core/widgets/spx_common_widgets.dart';

class DemoVoucher {
  final String code;
  final bool shopee;
  final DateTime receivedAt;
  final String? trackingId;

  DemoVoucher(
      {required this.code,
      required this.shopee,
      required this.receivedAt,
      this.trackingId});

  DateTime get expiresAt => receivedAt.add(const Duration(days: 15));
  String get title => shopee ? 'Shopee: 10% off' : 'SPX: shipping discount';
  String get description => shopee
      ? '10% off, no order value limit or discount cap.'
      : 'Save up to 30,000 VND on one SPX shipment.';
}

/// Demo UI only: vouchers are kept by the showcase for the current session.
class DemoVoucherPanel extends StatelessWidget {
  final List<DemoVoucher>? wallet;
  final DemoVoucher? received;
  final ValueChanged<bool>? onChoose;
  final VoidCallback onClose;

  const DemoVoucherPanel(
      {super.key,
      this.wallet,
      this.received,
      this.onChoose,
      required this.onClose});

  @override
  Widget build(BuildContext context) {
    final isWallet = wallet != null;
    return Positioned.fill(
      child: ColoredBox(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 44),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        Expanded(
                            child: LocalizedText(
                                isWallet
                                    ? 'My Promo Codes'
                                    : received != null
                                        ? 'Voucher received!'
                                        : 'A gift from SPX',
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700))),
                        if (isWallet || received != null)
                          IconButton(
                              onPressed: onClose,
                              icon: const Icon(Icons.close),
                              tooltip:
                                  AppLanguageScope.translate(context, 'Close')),
                      ]),
                      const SizedBox(height: 10),
                      LocalizedText(isWallet
                          ? 'Demo vouchers • Not redeemable'
                          : received != null
                              ? 'Saved to My Promo Codes.'
                              : 'SPX apologizes for the delay. Please choose one complimentary demo voucher.'),
                      const SizedBox(height: 14),
                      if (isWallet)
                        for (final voucher in wallet!)
                          _voucher(context, voucher),
                      if (received != null) _voucher(context, received!),
                      if (!isWallet && received == null) ...[
                        _choice(context, true),
                        const SizedBox(height: 12),
                        _choice(context, false),
                      ],
                      const SizedBox(height: 12),
                      const LocalizedText(
                          'Demo data only. Valid for 15 days from receipt.',
                          style: TextStyle(fontSize: 11, color: Colors.grey)),
                      if (received != null) ...[
                        const SizedBox(height: 14),
                        SpxPrimaryButton(
                            label: 'Done', showArrow: false, onTap: onClose),
                      ],
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _choice(BuildContext context, bool shopee) {
    final voucher =
        DemoVoucher(code: '', shopee: shopee, receivedAt: DateTime.now());
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color(0xFFFFF3EC),
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        LocalizedText(voucher.title,
            style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        LocalizedText(voucher.description),
        const SizedBox(height: 10),
        SpxPrimaryButton(
            label: shopee ? 'Choose Shopee voucher' : 'Choose SPX voucher',
            showArrow: false,
            onTap: () => onChoose?.call(shopee)),
      ]),
    );
  }

  Widget _voucher(BuildContext context, DemoVoucher voucher) {
    final date = voucher.expiresAt;
    final expiry =
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            LocalizedText(voucher.title,
                style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            LocalizedText(voucher.description),
            const SizedBox(height: 8),
            Text(voucher.code,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Color(0xFFAA481B))),
            Text('${AppLanguageScope.translate(context, 'Expires')}: $expiry'),
            if (voucher.trackingId != null)
              Text(voucher.trackingId!, style: const TextStyle(fontSize: 11)),
          ])),
    );
  }
}
