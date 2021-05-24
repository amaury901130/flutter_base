import 'package:theme/theme.dart';
import 'package:theme/variants/light.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final Widget home;

  App({required this.home});

  @override
  Widget build(BuildContext context) {
    //TODO: select the theme
    final theme = LightTheme();

    return AppTheme(
      theme: theme,
      home: MaterialApp(
        theme: theme.data,
        home: home,
      ),
    );
  }
}
