import 'package:agarrate/core/core.dart';
import 'package:agarrate/ui/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Core.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Add logic for initial screen
    return App(home: Container());
  }
}
