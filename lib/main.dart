import 'package:alejandro_besu/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:alejandro_besu/ui/views/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alejandro Besú',
      theme: appTheme,
      home: MainScreen(),
    );
  }
}
