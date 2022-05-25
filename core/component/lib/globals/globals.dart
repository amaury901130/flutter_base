import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
late SharedPreferences globalPreferences;

void navigateTo({
  required String route,
  required BuildContext withContext,
  Object? withArguments,
}) {
  Navigator.pushNamed(
    withContext,
    route,
    arguments: withArguments,
  );
}

void navigateAsWidget({
  required Widget screen,
  required BuildContext withContext,
}) {
  Navigator.of(
    withContext,
    rootNavigator: true,
  ).push(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => screen,
    ),
  );
}
