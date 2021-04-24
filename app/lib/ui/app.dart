import 'package:app/ui/theme/theme.dart';
import 'package:app/ui/theme/variants/light.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final Widget home;

  App({this.home});

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
