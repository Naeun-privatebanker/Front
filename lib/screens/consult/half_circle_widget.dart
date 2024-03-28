import 'dart:math' as math;
import 'package:flutter/material.dart';

class HalfCircleWidget extends StatelessWidget {
  final String riskRate;
  final String riskName;

  const HalfCircleWidget(this.riskRate, this.riskName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: HalfCirclePainter(),
                  ),
                ),
                _buildPiece(0, -30, Colors.red), // Red
                _buildPiece(-30, -60, Colors.orange), // Orange
                _buildPiece(-60, -90, Colors.yellow), // Yellow
                _buildPiece(-90, -120, Colors.green), // Green
                _buildPiece(-120, -150, Colors.blue), // Blue
                _buildPiece(-150, -180, Colors.purple),// Purple
              ],
            ),
          ),
          Positioned(
            top: 25,
            right: 25,
            child: SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    child: CustomPaint(
                    painter: HalfCirclePainter(),
                  ),
                  ),
                  _buildPiece(0, -180, Colors.black),
                ],
              ),
            ),
          ),
        ]
    );
  }

  Widget _buildPiece(double startAngle, double endAngle, Color color) {
    return Positioned.fill(
      child: CustomPaint(
        painter: HalfCirclePainter(startAngle, endAngle, color),
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final double startAngle;
  final double endAngle;
  final Color color;

  HalfCirclePainter([this.startAngle = 0, this.endAngle = -180, this.color = Colors.white]);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final startAngleRadians = math.pi * startAngle / 180;
    final endAngleRadians = math.pi * endAngle / 180;

    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..arcTo(rect, startAngleRadians, endAngleRadians - startAngleRadians, false)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}