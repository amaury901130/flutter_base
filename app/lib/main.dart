import 'package:app/app_init.dart';
import 'package:app/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInit.initialize();
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
