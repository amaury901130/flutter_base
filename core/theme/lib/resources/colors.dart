import 'package:flutter/material.dart';

abstract class AppColors {
  abstract final Color primary;
  abstract final Color primaryShade50;
  abstract final Color secondary;
  abstract final Color secondaryShade50;
  abstract final Color secondaryVariant;
  abstract final Color secondaryVariantShade50;

  abstract final Color textPrimary;
  abstract final Color textSecondary;
  abstract final Color textTertiary;
  abstract final Color textInput;
  abstract final Color textInputLabel;

  abstract final Color success;
  abstract final Color warning;
  abstract final Color error;

  abstract final Color itemSelected;
  abstract final Color itemUnselected;
  abstract final Color borderColor;

  abstract final Color surface;
  abstract final Color surfaceShade50;
  abstract final Color onSurface;
  abstract final Color onSurfaceShade50;

  abstract final Color shadowColor;
  abstract final Color dividerColor;
}
