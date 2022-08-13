import 'package:flutter/material.dart';
import 'package:pocman_game/pages/home_page.dart';
import 'package:pocman_game/util/fade_page_transition_page.dart';

void main() {
  runApp(const MyApp());
}

const double tileSize = 8;
int score = 0;
bool isScared = false;
bool died = false;
double timer = 200;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PocMan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: FadePageTransition(),
          TargetPlatform.iOS: FadePageTransition(),
          TargetPlatform.macOS: FadePageTransition(),
          TargetPlatform.windows: FadePageTransition(),
        }),
      ),
      home: const HomePage(),
    );
  }
}
