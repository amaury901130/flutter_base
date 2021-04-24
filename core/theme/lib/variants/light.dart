import 'package:theme/colors.dart';
import 'package:theme/spacing.dart';
import 'package:theme/theme.dart';
import 'package:flutter/material.dart';

class LightTheme extends LocalTheme {
  final spacing = Spacing(4.0);
  final textScale = TextScale(s: .86, m: 1, l: 1.14);

  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xFF2A374A),
    primaryVariant: const MaterialColor(
      0xFF9CA7B7,
      <int, Color>{
        50: const Color(0x669CA7B7),
      },
    ),
    secondary: const MaterialColor(
      0xFFF5406F,
      <int, Color>{
        500: const Color(0xFFF5406F),
      },
    ),
    secondaryVariant: const MaterialAccentColor(
      0xFF0BD27F,
      <int, Color>{
        100: const Color(0xFF1ADA39),
      },
    ),
    surface: const MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
        50: const Color(0xFFFFFFFF),
      },
    ),
    background: const Color(0xFFFFFFFF),
    error: const Color(0xFFF0524D),
    onPrimary: const MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
        50: const Color(0xFFFFFFFF),
      },
    ),
    onSecondary: const Color(0xFFFFFFFF),
    onSurface: const MaterialColor(
      0xFF2A374A,
      <int, Color>{
        50: const Color(0xFFEAEBED),
      },
    ),
    onBackground: MaterialColor(
      0xFF2A374A,
      <int, Color>{
        600: const Color(0xFF7F8792),
      },
    ),
    onError: const Color(0xFFFFFFFF),
  );

  final data = ThemeData.from(
    colorScheme: colorScheme,
    textTheme: Typography.blackCupertino.copyWith(
      headline1: titleXL,
      headline2: titleL,
      headline3: titleM,
      headline4: titleS,
      headline5: titleXS,
      button: button,
      bodyText1: body,
      bodyText2: bodyS,
      subtitle1: subtitleM,
      subtitle2: subtitleS,
      caption: caption,
      overline: label,
    ),
  ).copyWith(
    scaffoldBackgroundColor: colorScheme.background,
    shadowColor: const Color(0x0D08258C),
    dividerColor: const Color(0xFFF1F1F9),
  );
}

const primaryFont = '';
const primaryFontBlack = '';
const primaryFontMedium = '';
const primaryFontRoman = '';
const primaryFontHeavy = '';

const double titleXLFontSize = 27;
const double titleLFontSize = 22;
const double titleMFontSize = 20;
const double titleSFontSize = 16;
const double titleXSFontSize = 14;
const double buttonFontSize = 14;
const double bodyFontSize = 14;
const double bodyMFontSize = 14;
const double bodyLFontSize = 16;
const double bodySFontSize = 12;
const double navBarFontSize = 10;
const double subtitleMFontSize = 12;
const double subtitleSFontSize = 10;
const double inputTextFontSize = 10;
const double labelFontSize = 13;
const double labelSFontSize = 10;
const double captionFontSize = 12;

const titleXLHeight = 32.4 / titleXLFontSize;
const titleLHeight = 26.4 / titleLFontSize;
const titleMHeight = 24 / titleMFontSize;
const titleSHeight = 19.2 / titleSFontSize;
const titleXSHeight = 16.8 / titleXSFontSize;
const buttonHeight = 19.6 / buttonFontSize;
const bodyHeight = 16.41 / bodyFontSize;
const bodySHeight = 14 / bodyFontSize;
const subtitleMHeight = 14.4 / subtitleMFontSize;
const subtitleSHeight = 12 / subtitleSFontSize;
const inputTextHeight = 13 / inputTextFontSize;
const labelHeight = 9 / labelFontSize;
const inputFieldLabelHeight = 7 / labelFontSize;
const captionHeight = 14 / captionFontSize;

const navBarTitleUnselectedLight = const TextStyle(
  fontFamily: primaryFontMedium,
  fontSize: navBarFontSize,
  height: subtitleSHeight,
  letterSpacing: -.02,
  color: AppColors.unselectedItem,
);

const navBarTitleSelectedLight = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: navBarFontSize,
  height: subtitleSHeight,
  letterSpacing: -.02,
  color: AppColors.selectedItem,
);

const titleXL = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: titleXLFontSize,
  height: titleXLHeight,
  letterSpacing: -.07,
  color: AppColors.textPrimary,
);

const titleL = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: titleLFontSize,
  height: titleLHeight,
  letterSpacing: -.22,
  color: AppColors.textPrimary,
);

const titleM = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: titleMFontSize,
  height: titleMHeight,
  letterSpacing: -.2,
  color: AppColors.textPrimary,
);

const titleS = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: titleSFontSize,
  height: titleSHeight,
  letterSpacing: -.16,
  color: AppColors.textPrimary,
);

const titleXS = const TextStyle(
  fontFamily: primaryFontHeavy,
  fontSize: titleXSFontSize,
  height: titleXSHeight,
  letterSpacing: -.14,
  color: AppColors.textPrimary,
);

const subtitleM = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: subtitleMFontSize,
  height: subtitleMHeight,
  letterSpacing: -.12,
  color: AppColors.textPrimary,
);

const subtitleS = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: subtitleSFontSize,
  height: subtitleSHeight,
  letterSpacing: .6,
  color: AppColors.textPrimary,
);

const button = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: buttonFontSize,
  height: buttonHeight,
  letterSpacing: 1.4,
  color: AppColors.textPrimary,
);

const body = const TextStyle(
  fontFamily: primaryFontRoman,
  fontSize: bodyFontSize,
  height: bodyHeight,
  fontWeight: FontWeight.normal,
  letterSpacing: -.14,
  color: AppColors.textPrimary,
);

const bodyS = const TextStyle(
  fontFamily: primaryFontMedium,
  fontSize: bodySFontSize,
  height: bodySHeight,
  fontWeight: FontWeight.normal,
  letterSpacing: -.14,
  color: AppColors.textPrimary,
);

const inputText = const TextStyle(
  fontFamily: primaryFontMedium,
  fontSize: titleXSFontSize,
  height: inputTextHeight,
  color: AppColors.textInput,
  letterSpacing: .1,
);

const caption = const TextStyle(
  fontFamily: primaryFontHeavy,
  fontSize: captionFontSize,
  height: captionHeight,
  color: AppColors.textPrimary,
);

const label = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: labelFontSize,
  height: labelHeight,
  letterSpacing: 1,
  color: AppColors.textPrimary,
);

const labelS = const TextStyle(
  fontFamily: primaryFontBlack,
  fontSize: labelSFontSize,
  height: labelHeight,
  letterSpacing: 1,
  color: AppColors.textPrimary,
);
