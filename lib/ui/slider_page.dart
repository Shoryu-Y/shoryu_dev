import 'package:flutter/material.dart';
import 'package:shoryu_dev/customed_slider_track_shape.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  static const routePath = '/slider';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Slider'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: const CustomSliderTrackShape(),
                ),
                child: const SliderWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  var _value = 10.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      max: 100,
      divisions: 10,
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
