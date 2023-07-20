import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/meteo_controller.dart';
import '../widgets/display_loading.dart';
import '../widgets/display_meteo.dart';

class MeteoScreen extends StatefulWidget {
  const MeteoScreen({super.key});

  @override
  State<MeteoScreen> createState() => _MeteoScreenState();
}

class _MeteoScreenState extends State<MeteoScreen> {
  @override
  Widget build(BuildContext context) {
    MeteoController controller = context.read<MeteoController>();
    return (controller.isLoading)
        ? CupertinoPageScaffold(
            child: Center(
              child: DisplayLoading(controller: controller),
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.black,
              transitionBetweenRoutes: false,
              leading: (controller.isLoading)
                  ? const Text('')
                  : GestureDetector(
                      onTap: () {
                        controller.reset();
                        Navigator.pop;
                      },
                      child: const Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.white,
                      ),
                    ),
              middle: const Text(
                style: TextStyle(color: Colors.white),
                "Météo",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            child: Center(
              child: DisplayMeteo(controller: controller),
            ),
          );
  }
}
