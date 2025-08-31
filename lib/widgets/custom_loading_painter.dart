import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingArcPainter extends CustomPainter {
  final double progress;

  LoadingArcPainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2.3,
    );

    const double startAngle = -1.5;
    double sweepAngle = progress * 2 * 3.1416;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(LoadingArcPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
