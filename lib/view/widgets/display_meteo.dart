import 'package:flutter/material.dart';

import '../../controllers/meteo_controller.dart';
import '../../services/services.dart';
import '../../util/constants.dart';

class DisplayMeteo extends StatelessWidget {
  const DisplayMeteo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MeteoController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                //return TableRows according to weatherList provided
                ...List.generate(
                  controller.weatherList.length,
                  (index) => TableRow(
                    decoration: (index != controller.weatherList.length - 1)
                        ? const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.black)))
                        : const BoxDecoration(),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            villes[index],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Row(
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.thermostat_outlined,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.water_drop,
                                  size: 20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${controller.weatherList[index].temperature}°C",
                                    style: const TextStyle(fontSize: 23)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                      "${controller.weatherList[index].humidity}%",
                                      style: const TextStyle(fontSize: 13)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 85,
                            MeteoService().meteoIcon(
                                controller.weatherList[index].icon),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    controller.reset();
                    controller.setLoading(true);
                    controller.setPercent = 0;
                    MeteoService().init(context, false);
                  },
                  child: const Text(
                    "Recommencer",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
