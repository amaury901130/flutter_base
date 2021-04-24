import 'package:theme/spacing.dart';
import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  AppTheme({
    Key key,
    this.theme,
    Widget home,
  }) : super(key: key, child: home);

  final LocalTheme theme;

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return true;
  }
}

class TextScale {
  final double s;
  final double m;
  final double l;

  TextScale({this.s, this.m, this.l});
}

abstract class LocalTheme {
  static const largeButtonHeight = 46.0;
  static const smallButtonHeight = 30.0;
  static const buttonBorderRadius = 1000.0;
  static const outlinedButtonBorderWidthLarge = 2.0;
  static const outlinedButtonBorderWidthSmall = 1.0;

  final ThemeData data;
  final TextScale textScale;
  final Spacing spacing;

  LocalTheme({
    this.data,
    this.textScale,
    this.spacing,
  });

  static Color getColorShade({Color color, int shade}) {
    if (color is ColorSwatch) {
      return color[shade] ?? color;
    }

    return color;
  }

  TextStyle getSmallButtonTextStyle() {
    final smallButtonTextSize = data.textTheme.button.fontSize * textScale.s;
    return data.textTheme.button.copyWith(
      fontSize: smallButtonTextSize,
    );
  }
}

extension WidgetDesignSystemTheme on Widget {
  LocalTheme designSystem(BuildContext context) {
    return AppTheme.of(context).theme;
  }
}

extension StateDesignSystemTheme on State {
  LocalTheme designSystem(BuildContext context) {
    return AppTheme.of(context).theme;
  }
}

extension ColorShade on Color {
  Color shade(int shade) {
    final color = this;

    if (color is ColorSwatch) return color[shade] ?? color;

    return this;
  }
}
