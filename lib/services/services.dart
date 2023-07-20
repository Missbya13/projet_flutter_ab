import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../controllers/meteo_controller.dart';
import 'api_service.dart';

class MeteoService {
  void init(BuildContext context, bool isRetry) {
    context.read<MeteoController>()
      ..reset()
      ..setLoading(true);

    messageAnimation(context);
    progressBarAnimation(context);
    incrementPercentage(context);
  }

  void messageAnimation(BuildContext context) {
    MeteoController meteoController = context.read<MeteoController>();
    if (!meteoController.isLoading) {
      return;
    }

    Future.delayed(const Duration(seconds: 6), () {
      if (meteoController.messageIndex == 2) {
        meteoController.setMessageIndex = 0;
      } else {
        meteoController.incrementMessageIndex(1);
      }
      if (meteoController.isLoading) {
        messageAnimation(context);
      } else {
        meteoController.setMessageIndex = 0;
      }
    }).catchError((error) {
      meteoController.reset();
      log(error);
    });
  }

  void incrementPercentage(BuildContext context) async {
    MeteoController meteoController = context.read<MeteoController>();
    if (!meteoController.isLoading) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 60), () {
      if (meteoController.percent < 1) {
        meteoController.incrementPercent();
        log(meteoController.getPercentString);
        incrementPercentage(context);
      }
    });
  }

  void progressBarAnimation(context) {
    MeteoController meteoController = context.read<MeteoController>();
    if (!meteoController.isLoading) {
      return;
    }

    Future.delayed(const Duration(seconds: 1), () async {
      await getMeteo(meteoController.counter).then((value) async {
        meteoController.addWeatherList(value);
        if (meteoController.getCounter == 4) {
          Future.delayed(const Duration(seconds: 1), () {
            meteoController.setLoading(false);
            meteoController.setPercent = 0.0;
          });
        } else {
          meteoController.incrementCounter();
          progressBarAnimation(context);
        }
      }).catchError((error) {
        meteoController.reset();
        log(error);
      });
    }).catchError((error) {
      meteoController.reset();
      log(error);
    });
  }

  IconData meteoIcon(String icon) {
    switch (icon) {
      case "01d":
        return CupertinoIcons.sun_max;
      case "01n":
        return CupertinoIcons.moon;
      case "02d":
        return CupertinoIcons.cloud_sun;
      case "02n":
        return CupertinoIcons.cloud_moon;
      case "03d":
        return CupertinoIcons.cloud;
      case "03n":
        return CupertinoIcons.cloud;
      case "04d":
        return CupertinoIcons.cloud_fill;
      case "04n":
        return CupertinoIcons.cloud_fill;
      case "09d":
        return CupertinoIcons.cloud_drizzle;
      case "09n":
        return CupertinoIcons.cloud_drizzle;
      case "10d":
        return CupertinoIcons.cloud_rain;
      case "10n":
        return CupertinoIcons.cloud_rain;
      case "11d":
        return CupertinoIcons.cloud_bolt;
      case "11n":
        return CupertinoIcons.cloud_bolt;
      case "13d":
        return CupertinoIcons.cloud_snow;
      case "13n":
        return CupertinoIcons.cloud_snow;
      case "50d":
        return CupertinoIcons.cloud_fog;
      case "50n":
        return CupertinoIcons.cloud_fog;
      default:
        return CupertinoIcons.cloud;
    }
  }
}
