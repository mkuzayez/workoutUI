import 'package:flutter/material.dart';
import 'package:workout_ui/home.dart';
import 'package:flutter/services.dart';

final theme = ThemeData(
  useMaterial3: true,
  fontFamily: "lato",
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 255, 119, 0),
  ),
);
void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      theme: theme,
      home: const Home(),
    ),
  );
}
