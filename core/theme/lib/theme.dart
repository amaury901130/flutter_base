import 'package:theme/spacing.dart';
import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  AppTheme({
    Key? key,
    required this.theme,
    required Widget home,
  }) : super(key: key, child: home);

  final LocalTheme theme;

  static AppTheme? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>();

  @override
  bool updateShouldNotify(AppTheme oldWidget) => true;
}

class TextScale {
  final double small;
  final double medium;
  final double large;

  TextScale({required this.small, required this.medium, required this.large});
}

abstract class LocalTheme {
  abstract final ThemeData data;
  abstract final TextScale textScale;
  abstract final Spacing spacing;
}

extension WidgetDesignSystemTheme on Widget {
  LocalTheme themeOf({required BuildContext context}) => context._theme();
}

extension _ContextTheme on BuildContext {
  LocalTheme _theme() => AppTheme.of(this)!.theme;
}

extension StateDesignSystemTheme on State {
  LocalTheme themeOf({required BuildContext context}) => context._theme();
}

extension ColorShade on Color {
  Color shade(int shade) {
    final color = this;

    if (color is ColorSwatch) return color[shade] ?? color;

    return this;
  }
}
