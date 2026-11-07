import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Custom geometric vector icons matching the 100% SPX Express design reference.
class SpxCustomIcons {
  SpxCustomIcons._();

  /// Isometric 3D Parcel Box Icon (used in Screen 02 parcel card)
  static Widget parcelBox({double size = 22, Color color = AppColors.primaryOrange}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _ParcelBoxPainter(color: color),
    );
  }

  /// Parcel Box with Magnifying Glass Icon (used in Bottom Nav "Parcels")
  static Widget parcelSearch({double size = 22, Color color = AppColors.navInactive}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _ParcelSearchPainter(color: color),
    );
  }

  /// Support Headset with Speech Bubble Icon (used in Bottom Nav "Support")
  static Widget supportHeadset({double size = 22, Color color = AppColors.navInactive}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _SupportHeadsetPainter(color: color),
    );
  }

  /// Home Outline Icon (used in Bottom Nav "Home")
  static Widget homeIcon({double size = 22, Color color = AppColors.navInactive}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _HomeIconPainter(color: color),
    );
  }

  /// User Account Outline Icon (used in Bottom Nav "Account")
  static Widget accountIcon({double size = 22, Color color = AppColors.navInactive}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _AccountIconPainter(color: color),
    );
  }

  /// Delivery Truck Outline Icon (used in Screen 05 Resolution Update)
  static Widget deliveryTruck({double size = 24, Color color = AppColors.primaryOrange}) {
    return CustomPaint(
      size: Size(size * 1.15, size),
      painter: _DeliveryTruckPainter(color: color),
    );
  }

  /// S-Curve Route Waypoints Icon (used in Screen 05 Resolution Update inner card)
  static Widget routePath({double size = 22, Color color = AppColors.primaryOrange}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _RoutePathPainter(color: color),
    );
  }

  /// Tilted Paperclip Icon (used in Screen 04 Related Parcel)
  static Widget paperclip({double size = 18, Color color = AppColors.primaryOrange}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _PaperclipPainter(color: color),
    );
  }

  /// Overlapping Copy Squares Icon (used in Screen 01 Tracking Number)
  static Widget copyIcon({double size = 16, Color color = const Color(0xFF5A606A)}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _CopyIconPainter(color: color),
    );
  }

  /// Scalloped Seal Checkmark Icon (used in Screen 02 "Verified" badge)
  static Widget verifiedSeal({double size = 14, Color color = AppColors.primaryOrange}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _VerifiedSealPainter(color: color),
    );
  }

  /// Sorting Hub Warehouse Icon (used in Screen 02 Sorting Hub card)
  static Widget warehouseHub({double size = 24, Color color = AppColors.textPrimary}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _WarehouseHubPainter(color: color),
    );
  }

  /// Calendar Outline Icon (used in Screen 03 Estimated Delivery Time card)
  static Widget calendarIcon({double size = 20, Color color = AppColors.primaryOrange}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _CalendarIconPainter(color: color),
    );
  }

  /// Speech Bubble Outline Icon (used in Screen 03 "Review parcel details" button)
  static Widget speechBubble({double size = 18, Color color = AppColors.textPrimary}) {
    return CustomPaint(
      size: Size.square(size),
      painter: _SpeechBubblePainter(color: color),
    );
  }
}

class _ParcelBoxPainter extends CustomPainter {
  final Color color;
  _ParcelBoxPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    final top = Offset(w * 0.5, h * 0.1);
    final rightTop = Offset(w * 0.88, h * 0.3);
    final rightBottom = Offset(w * 0.88, h * 0.72);
    final bottom = Offset(w * 0.5, h * 0.92);
    final leftBottom = Offset(w * 0.12, h * 0.72);
    final leftTop = Offset(w * 0.12, h * 0.3);
    final center = Offset(w * 0.5, h * 0.5);

    final path = Path()
      ..moveTo(top.dx, top.dy)
      ..lineTo(rightTop.dx, rightTop.dy)
      ..lineTo(rightBottom.dx, rightBottom.dy)
      ..lineTo(bottom.dx, bottom.dy)
      ..lineTo(leftBottom.dx, leftBottom.dy)
      ..lineTo(leftTop.dx, leftTop.dy)
      ..close();

    canvas.drawPath(path, paint);

    // Inner Y lines
    canvas.drawLine(leftTop, center, paint);
    canvas.drawLine(rightTop, center, paint);
    canvas.drawLine(center, bottom, paint);

    // Package tape line across top
    canvas.drawLine(
      Offset(w * 0.31, h * 0.2),
      Offset(w * 0.69, h * 0.4),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ParcelBoxPainter oldDelegate) => oldDelegate.color != color;
}

class _ParcelSearchPainter extends CustomPainter {
  final Color color;
  _ParcelSearchPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    final top = Offset(w * 0.46, h * 0.08);
    final rightTop = Offset(w * 0.84, h * 0.27);
    final leftTop = Offset(w * 0.08, h * 0.27);
    final leftBottom = Offset(w * 0.08, h * 0.68);
    final bottom = Offset(w * 0.46, h * 0.87);
    final center = Offset(w * 0.46, h * 0.46);

    // Outer hex with gap on bottom-right for magnifier
    final boxPath = Path()
      ..moveTo( rightTop.dx, rightTop.dy + h * 0.15)
      ..lineTo(rightTop.dx, rightTop.dy)
      ..lineTo(top.dx, top.dy)
      ..lineTo(leftTop.dx, leftTop.dy)
      ..lineTo(leftBottom.dx, leftBottom.dy)
      ..lineTo(bottom.dx, bottom.dy)
      ..lineTo(w * 0.56, h * 0.82);
    canvas.drawPath(boxPath, paint);

    // Inner Y lines
    canvas.drawLine(leftTop, center, paint);
    canvas.drawLine(rightTop, center, paint);
    canvas.drawLine(center, bottom, paint);
    canvas.drawLine(Offset(w * 0.27, h * 0.175), Offset(w * 0.65, h * 0.365), paint);

    // Magnifying glass at bottom right
    final magCenter = Offset(w * 0.74, h * 0.70);
    canvas.drawCircle(magCenter, w * 0.14, paint);
    canvas.drawLine(
      Offset(magCenter.dx + w * 0.1, magCenter.dy + w * 0.1),
      Offset(w * 0.94, h * 0.90),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ParcelSearchPainter oldDelegate) => oldDelegate.color != color;
}

class _SupportHeadsetPainter extends CustomPainter {
  final Color color;
  _SupportHeadsetPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Headband arc
    final rect = Rect.fromLTWH(w * 0.16, h * 0.10, w * 0.68, h * 0.64);
    canvas.drawArc(rect, 3.14159, 3.14159, false, paint);

    // Left ear cup
    final leftCup = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.12, h * 0.42, w * 0.14, h * 0.26),
      const Radius.circular(3),
    );
    canvas.drawRRect(leftCup, paint);

    // Right ear cup
    final rightCup = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.74, h * 0.42, w * 0.14, h * 0.26),
      const Radius.circular(3),
    );
    canvas.drawRRect(rightCup, paint);

    // Microphone boom curving to bottom center
    final micPath = Path()
      ..moveTo(w * 0.82, h * 0.68)
      ..quadraticBezierTo(w * 0.82, h * 0.88, w * 0.56, h * 0.88)
      ..lineTo(w * 0.44, h * 0.88);
    canvas.drawPath(micPath, paint);
  }

  @override
  bool shouldRepaint(covariant _SupportHeadsetPainter oldDelegate) => oldDelegate.color != color;
}

class _HomeIconPainter extends CustomPainter {
  final Color color;
  _HomeIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    final housePath = Path()
      ..moveTo(w * 0.14, h * 0.44)
      ..lineTo(w * 0.50, h * 0.12)
      ..lineTo(w * 0.86, h * 0.44)
      ..lineTo(w * 0.86, h * 0.86)
      ..lineTo(w * 0.14, h * 0.86)
      ..close();

    canvas.drawPath(housePath, paint);

    // Door
    final doorPath = Path()
      ..moveTo(w * 0.39, h * 0.86)
      ..lineTo(w * 0.39, h * 0.58)
      ..lineTo(w * 0.61, h * 0.58)
      ..lineTo(w * 0.61, h * 0.86);
    canvas.drawPath(doorPath, paint);
  }

  @override
  bool shouldRepaint(covariant _HomeIconPainter oldDelegate) => oldDelegate.color != color;
}

class _AccountIconPainter extends CustomPainter {
  final Color color;
  _AccountIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Head circle
    canvas.drawCircle(Offset(w * 0.5, h * 0.32), w * 0.19, paint);

    // Shoulders arc
    final bodyPath = Path()
      ..moveTo(w * 0.16, h * 0.86)
      ..quadraticBezierTo(w * 0.18, h * 0.58, w * 0.50, h * 0.58)
      ..quadraticBezierTo(w * 0.82, h * 0.58, w * 0.84, h * 0.86);
    canvas.drawPath(bodyPath, paint);
  }

  @override
  bool shouldRepaint(covariant _AccountIconPainter oldDelegate) => oldDelegate.color != color;
}

class _DeliveryTruckPainter extends CustomPainter {
  final Color color;
  _DeliveryTruckPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Cargo box
    final cargoPath = Path()
      ..moveTo(w * 0.08, h * 0.68)
      ..lineTo(w * 0.08, h * 0.20)
      ..lineTo(w * 0.62, h * 0.20)
      ..lineTo(w * 0.62, h * 0.68);
    canvas.drawPath(cargoPath, paint);

    // Cab
    final cabPath = Path()
      ..moveTo(w * 0.62, h * 0.34)
      ..lineTo(w * 0.80, h * 0.34)
      ..lineTo(w * 0.92, h * 0.52)
      ..lineTo(w * 0.92, h * 0.68)
      ..lineTo(w * 0.84, h * 0.68);
    canvas.drawPath(cabPath, paint);

    // Bottom connecting lines around wheels
    canvas.drawLine(Offset(w * 0.08, h * 0.68), Offset(w * 0.18, h * 0.68), paint);
    canvas.drawLine(Offset(w * 0.38, h * 0.68), Offset(w * 0.64, h * 0.68), paint);

    // Wheels
    canvas.drawCircle(Offset(w * 0.28, h * 0.70), h * 0.11, paint);
    canvas.drawCircle(Offset(w * 0.74, h * 0.70), h * 0.11, paint);
  }

  @override
  bool shouldRepaint(covariant _DeliveryTruckPainter oldDelegate) => oldDelegate.color != color;
}

class _RoutePathPainter extends CustomPainter {
  final Color color;
  _RoutePathPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Top right circle node
    final r = w * 0.11;
    final topNode = Offset(w * 0.76, h * 0.24);
    final bottomNode = Offset(w * 0.24, h * 0.76);

    canvas.drawCircle(topNode, r, paint);
    canvas.drawCircle(bottomNode, r, paint);

    // S-curve track between top and bottom nodes
    final path = Path()
      ..moveTo(topNode.dx - r, topNode.dy)
      ..lineTo(w * 0.30, topNode.dy)
      ..arcToPoint(
        Offset(w * 0.30, h * 0.50),
        radius: Radius.circular(h * 0.13),
        clockwise: false,
      )
      ..lineTo(w * 0.70, h * 0.50)
      ..arcToPoint(
        Offset(w * 0.70, bottomNode.dy),
        radius: Radius.circular(h * 0.13),
        clockwise: true,
      )
      ..lineTo(bottomNode.dx + r, bottomNode.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _RoutePathPainter oldDelegate) => oldDelegate.color != color;
}

class _PaperclipPainter extends CustomPainter {
  final Color color;
  _PaperclipPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    canvas.save();
    canvas.translate(w * 0.5, h * 0.5);
    canvas.rotate(0.75); // 43 degrees tilt
    canvas.translate(-w * 0.5, -h * 0.5);

    final path = Path()
      ..moveTo(w * 0.35, h * 0.62)
      ..lineTo(w * 0.35, h * 0.25)
      ..arcToPoint(
        Offset(w * 0.65, h * 0.25),
        radius: Radius.circular(w * 0.15),
        clockwise: true,
      )
      ..lineTo(w * 0.65, h * 0.72)
      ..arcToPoint(
        Offset(w * 0.25, h * 0.72),
        radius: Radius.circular(w * 0.20),
        clockwise: true,
      )
      ..lineTo(w * 0.25, h * 0.32);

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _PaperclipPainter oldDelegate) => oldDelegate.color != color;
}

class _CopyIconPainter extends CustomPainter {
  final Color color;
  _CopyIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Front rectangle (bottom-right)
    final frontRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.30, h * 0.30, w * 0.56, h * 0.58),
      const Radius.circular(2.5),
    );
    canvas.drawRRect(frontRect, paint);

    // Back rectangle (top-left)
    final backPath = Path()
      ..moveTo(w * 0.30, h * 0.70)
      ..lineTo(w * 0.20, h * 0.70)
      ..arcToPoint(
        Offset(w * 0.14, h * 0.64),
        radius: const Radius.circular(2.5),
        clockwise: true,
      )
      ..lineTo(w * 0.14, h * 0.20)
      ..arcToPoint(
        Offset(w * 0.20, h * 0.14),
        radius: const Radius.circular(2.5),
        clockwise: true,
      )
      ..lineTo(w * 0.62, h * 0.14)
      ..arcToPoint(
        Offset(w * 0.68, h * 0.20),
        radius: const Radius.circular(2.5),
        clockwise: true,
      )
      ..lineTo(w * 0.68, h * 0.30);

    canvas.drawPath(backPath, paint);
  }

  @override
  bool shouldRepaint(covariant _CopyIconPainter oldDelegate) => oldDelegate.color != color;
}

class _VerifiedSealPainter extends CustomPainter {
  final Color color;
  _VerifiedSealPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Outer circle/badge
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.42, paint);

    // Inner checkmark
    final checkPath = Path()
      ..moveTo(w * 0.33, h * 0.52)
      ..lineTo(w * 0.45, h * 0.64)
      ..lineTo(w * 0.68, h * 0.38);
    canvas.drawPath(checkPath, paint);
  }

  @override
  bool shouldRepaint(covariant _VerifiedSealPainter oldDelegate) => oldDelegate.color != color;
}

class _WarehouseHubPainter extends CustomPainter {
  final Color color;
  _WarehouseHubPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Outer warehouse pitched roof & walls + base
    final outerPath = Path()
      ..moveTo(w * 0.14, h * 0.34)
      ..lineTo(w * 0.50, h * 0.14)
      ..lineTo(w * 0.86, h * 0.34)
      ..lineTo(w * 0.86, h * 0.84)
      ..lineTo(w * 0.14, h * 0.84)
      ..close();
    canvas.drawPath(outerPath, paint);

    // Garage roller door frame
    final doorRect = Path()
      ..moveTo(w * 0.30, h * 0.84)
      ..lineTo(w * 0.30, h * 0.44)
      ..lineTo(w * 0.70, h * 0.44)
      ..lineTo(w * 0.70, h * 0.84);
    canvas.drawPath(doorRect, paint);

    // Horizontal roller slats
    canvas.drawLine(Offset(w * 0.30, h * 0.57), Offset(w * 0.70, h * 0.57), paint);
    canvas.drawLine(Offset(w * 0.30, h * 0.70), Offset(w * 0.70, h * 0.70), paint);
  }

  @override
  bool shouldRepaint(covariant _WarehouseHubPainter oldDelegate) => oldDelegate.color != color;
}

class _CalendarIconPainter extends CustomPainter {
  final Color color;
  _CalendarIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.55
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Main calendar box
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.12, h * 0.20, w * 0.76, h * 0.68),
      const Radius.circular(3.0),
    );
    canvas.drawRRect(rrect, paint);

    // Top rings
    canvas.drawLine(Offset(w * 0.32, h * 0.11), Offset(w * 0.32, h * 0.25), paint);
    canvas.drawLine(Offset(w * 0.68, h * 0.11), Offset(w * 0.68, h * 0.25), paint);

    // Header divider line
    canvas.drawLine(Offset(w * 0.12, h * 0.39), Offset(w * 0.88, h * 0.39), paint);

    // Small grid dots inside calendar
    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    for (final dx in [0.32, 0.50, 0.68]) {
      for (final dy in [0.54, 0.70]) {
        canvas.drawCircle(Offset(w * dx, h * dy), 1.15, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CalendarIconPainter oldDelegate) => oldDelegate.color != color;
}

class _SpeechBubblePainter extends CustomPainter {
  final Color color;
  _SpeechBubblePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.75
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    final path = Path()
      ..moveTo(w * 0.22, h * 0.74)
      ..lineTo(w * 0.14, h * 0.86)
      ..lineTo(w * 0.34, h * 0.81)
      ..arcToPoint(
        Offset(w * 0.86, h * 0.48),
        radius: Radius.circular(w * 0.38),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(w * 0.14, h * 0.48),
        radius: Radius.circular(w * 0.38),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(w * 0.22, h * 0.74),
        radius: Radius.circular(w * 0.38),
        clockwise: false,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SpeechBubblePainter oldDelegate) => oldDelegate.color != color;
}


