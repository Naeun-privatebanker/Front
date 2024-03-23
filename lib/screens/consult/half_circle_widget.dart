import 'package:flutter/material.dart';
import 'dart:math';

class HalfCirclePainter extends CustomPainter {
  final String riskRate;
  final String riskName;

  HalfCirclePainter(this.riskRate, this.riskName);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue // 반원의 색상
      ..style = PaintingStyle.fill;

    // 캔버스 크기
    final double width = size.width;
    final double height = size.height;

    // 반원을 그리기 위한 경로 생성
    Path path = Path();
    path.moveTo(0, height / 2);
    path.quadraticBezierTo(0, 0, width / 2, 0);
    path.arcTo(Rect.fromLTWH(0, 0, width, height), -pi, pi, false);
    path.quadraticBezierTo(width, 0, width, height / 2);
    path.close();

    // 생성한 경로를 캔버스에 그리기
    canvas.drawPath(path, paint);

    // 텍스트 그리기
    TextSpan span = TextSpan(
      style: TextStyle(color: Colors.white, fontSize: 20),
      children: [
        TextSpan(text: riskRate + '\n',),
        TextSpan(text: riskName),
      ],
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas, Offset((width - tp.width) / 2, (height - tp.height) / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HalfCircleWidget extends StatelessWidget {
  final String riskRate;
  final String riskName;

  HalfCircleWidget(this.riskRate, this.riskName);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HalfCirclePainter(riskRate, riskName),
      size: Size(MediaQuery.of(context).size.width, 90), // 조절 가능한 크기
    );
  }
}
