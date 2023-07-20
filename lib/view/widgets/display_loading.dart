import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../controllers/meteo_controller.dart';

class DisplayLoading extends StatelessWidget {
  const DisplayLoading({
    super.key,
    required this.controller,
  });

  final MeteoController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<MeteoController>(
          builder: (context, message, child) => Text(
            controller.getMessage,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            lineHeight: 40.0,
            animationDuration: 900,
            animation: true,
            animateFromLastPercent: true,
            percent: (controller.getPercent),
            center: Text(
              "${(controller.getPercentString)}%",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            barRadius: const Radius.circular(10.0),
            progressColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
