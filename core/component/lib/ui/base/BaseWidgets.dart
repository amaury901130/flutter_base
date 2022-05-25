import 'package:component/resources/locale/localize.dart';
import 'package:component/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/spacing.dart';

// ignore: must_be_immutable
class BaseConsumerWidget extends ConsumerWidget with _ThemeData {
  Widget onBuild(BuildContext context, WidgetRef ref) => Center(
        child: Text(
          context.getString(Localize.welcome_message),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setUpTheme(context);
    return onBuild(context, ref);
  }
}

// ignore: must_be_immutable
class BaseStatelessWidget extends StatelessWidget with _ThemeData {
  Widget onBuild(BuildContext context) => Center(
        child: Text(
          context.getString(Localize.welcome_message),
        ),
      );

  @override
  Widget build(BuildContext context) {
    setUpTheme(context);
    return onBuild(context);
  }
}

mixin _ThemeData {
  late ThemeData theme;
  late TextTheme textTheme;
  late Spacing spacing;

  void setUpTheme(BuildContext context) {
    theme = Theme.of(context);
    textTheme = theme.textTheme;
    spacing = theme.spacing;
  }
}
