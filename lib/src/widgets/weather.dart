import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key, this.weatherIndicator});

  final double? weatherIndicator;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WeatherPainter(weatherIndicator: weatherIndicator ?? 0.5),
      size: const Size(200, 200),
    );
  }
}

class WeatherPainter extends CustomPainter {
  final double weatherIndicator;

  WeatherPainter({required this.weatherIndicator});

  @override
  void paint(Canvas canvas, Size size) {
    var sunOpacity =
        weatherIndicator > 0.7 ? 0.0 : 1 - weatherIndicator * 10.0 / 7.0;

    final sun = Paint()
      ..color = Colors.yellow.shade600.withOpacity(sunOpacity)
      ..style = PaintingStyle.fill;

    var cloudOpacity =
        weatherIndicator < 0.2 ? 0.0 : weatherIndicator * 5.0 / 4.0 - 1.0 / 4.0;

    final cloud = Paint()
      ..color = Colors.grey.withOpacity(cloudOpacity)
      ..style = PaintingStyle.fill;

    var dropsOpacity = weatherIndicator < 0.7
        ? 0.0
        : weatherIndicator * 10.0 / 3.0 - 7.0 / 3.0;

    final drops = Paint()
      ..color = Colors.blue.withOpacity(dropsOpacity)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(const Offset(100, 55), 50, sun);

    var cloudPath = Path()
      ..moveTo(150, 130)
      ..arcToPoint(
        const Offset(150, 60),
        radius: const Radius.circular(35),
        clockwise: false,
      )
      ..arcToPoint(
        const Offset(80, 130),
        clockwise: false,
        largeArc: true,
        radius: const Radius.elliptical(70, 55),
      )
      ..close();

    canvas.drawPath(cloudPath, cloud);

    var dropsPath = Path()
      ..moveTo(60, 150)
      ..lineTo(55, 170)
      ..moveTo(100, 160)
      ..lineTo(95, 180)
      ..moveTo(140, 150)
      ..lineTo(135, 170)
      ..moveTo(135, 170)
      ..close();

    canvas.drawPath(dropsPath, drops);
  }

  @override
  bool shouldRepaint(WeatherPainter oldDelegate) =>
      weatherIndicator == oldDelegate.weatherIndicator ? false : true;

  @override
  bool shouldRebuildSemantics(WeatherPainter oldDelegate) => false;
}

String getWeatherDescription(double sliderValue) {
  if (sliderValue < 0.25) {
    return 'Ясно';
  } else if (sliderValue < 0.5) {
    return 'Малооблачно';
  } else if (sliderValue < 0.75) {
    return 'Облачно';
  } else {
    return 'Дождь';
  }
}
