import 'package:component/resources/app_localization.dart';
import 'package:component/resources/locale/localize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'dim.dart';

part 'images.dart';

extension ContextString on BuildContext {
  String getString(
    Localize localize, {
    List<String>? params,
  }) =>
      AppLocalizations.of(this).getString(localize, params);
}
