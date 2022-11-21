import 'package:advanced_widgets/src/widgets/weather.dart';
import 'package:flutter/material.dart';

import 'color_palette_button.dart';
import 'custom_child_overlay.dart';
import 'switch_color_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _currentSliderValue = 0.0;
  late AnimationController _animation;
  bool _isWeatherWidgetBig = false;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      lowerBound: 200,
      upperBound: 400,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: _makeWeatherIndicator(),
        title: Text(widget.title),
        actions: const [SwitchColorButton(), ColorPaletteButton()],
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              _isWeatherWidgetBig ? _animation.reverse() : _animation.forward();
              _isWeatherWidgetBig = !_isWeatherWidgetBig;
            },
            child: SizedBox(
              width: _animation.value,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Weather(
                      weatherIndicator: _currentSliderValue,
                    ),
                    CustomChildOverlay(
                      child: _isWeatherWidgetBig
                          ? Text(
                              getWeatherDescription(_currentSliderValue),
                              textScaleFactor: 1.8,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  Widget _makeWeatherIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 200,
        height: 55,
        child: Slider(
          thumbColor: Theme.of(context).scaffoldBackgroundColor,
          activeColor: Theme.of(context).focusColor,
          inactiveColor: Theme.of(context).backgroundColor,
          value: _currentSliderValue,
          max: 1.0,
          onChanged: ((double value) => setState(
                () {
                  _currentSliderValue = value;
                },
              )),
        ),
      ),
    );
  }
}
