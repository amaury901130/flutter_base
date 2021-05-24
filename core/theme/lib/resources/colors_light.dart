import 'dart:ui';

import 'package:theme/resources/colors.dart';

class ColorsLight implements AppColors {
  @override
  Color get borderColor => Color(0xFFE0524D);

  @override
  Color get error => Color(0xFFF0524D);

  @override
  Color get onSurface => Color(0xFFFFEEEE);

  @override
  Color get success => Color(0xFF1AD139);

  @override
  Color get surface => Color(0xFFFFFFFF);

  @override
  Color get textInput => Color(0xFF251D1F);

  @override
  Color get textInputLabel => Color(0xFF939393);

  @override
  Color get textPrimary => Color(0xFF2A374A);

  @override
  Color get textSecondary => Color(0xFF555F6E);

  @override
  Color get textTertiary => Color(0xFF0BD27F);

  @override
  Color get itemSelected => Color(0xFFF5406F);

  @override
  Color get itemUnselected => Color(0xFF2A374A);

  @override
  Color get warning => Color(0xFFE0CB07);

  @override
  Color get primary => Color(0xFFFFFFFF);

  @override
  Color get secondary => Color(0xFFF5406F);

  @override
  Color get dividerColor => Color(0x0D08258C);

  @override
  Color get shadowColor => Color(0xFFF1F1F9);

  @override
  Color get onSurfaceShade50 => Color(0xAAFFFFEE);

  @override
  Color get primaryShade50 => Color(0xAAFFFFEE);

  @override
  Color get secondaryShade50 => Color(0xAAF5406F);

  @override
  Color get secondaryVariant => Color(0xFF0BD27F);

  @override
  Color get secondaryVariantShade50 => Color(0xAA0BD27F);

  @override
  Color get surfaceShade50 => throw UnimplementedError();
}
