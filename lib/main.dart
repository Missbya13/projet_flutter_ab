import 'package:examen_flutter_aby/services/services.dart';
import 'package:examen_flutter_aby/view/pages/meteo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/meteo_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MeteoController>(
          create: (_) => MeteoController(),
        ),
      ],
      child: const CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Examen Flutter',
          theme: CupertinoThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 49, 48, 48),
            primaryColor: Colors.black,
            textTheme: CupertinoTextThemeData(
              navLargeTitleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              navTitleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              navActionTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.black,
        transitionBetweenRoutes: false,
        leading: Text(""),
        middle: Text(
          "Examen flutter",
          overflow: TextOverflow.ellipsis,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Voir les infos meteo dès maintenant !',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeteoScreen(),
                  ),
                );
                MeteoService().init(context, false);
              },
              child: const Text('Commencer'),
            )
          ],
        ),
      ),
    );
  }
}
