import 'package:component/providers/theme_provider.dart';
import 'package:component/resources/locale/localize.dart';
import 'package:component/resources/r.dart';
import 'package:component/ui/base/BaseWidgets.dart';
import 'package:domain/models/character.dart';
import 'package:domain/services/abstract/character_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends BaseConsumerWidget {
  static const route = '/';
  final helloWorldProvider = StateProvider<String>((_) => 'Sample get data provider');

  CharacterService get characterService => CharacterService.instance;

  @override
  Widget onBuild(BuildContext context, WidgetRef ref) {
    // In this way you will watch the state changes in the entire widget and
    // it's going to rebuild all the widget
    final helloTextWatcher = ref.watch(helloWorldProvider);
    final textStyle = theme.textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              helloTextWatcher,
              style: textStyle.headline1,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                ThemeModeHelper.toggleTheme(ref);
              },
              child: Text(
                "Change my theme",
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Localization.instance.saveLang(ref, Lang.es);
              },
              child: Text(
                "Change lang to Spanish",
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Localization.instance.saveLang(ref, Lang.en);
              },
              child: Text(
                "Change lang to ENGLISH",
                textAlign: TextAlign.center,
              ),
            ),
            // Use this a consumer to update only where you needed
            Consumer(
              builder: (context, refWatcher, _) {
                final helloTextWatcher = refWatcher.watch(helloWorldProvider);
                return Text(
                  helloTextWatcher,
                  style: textStyle.headline1,
                );
              },
            ),
            Text(
              context.getString(Localize.welcome_message),
              style: textStyle.headline1,
            ),
            Text(
              "-----------------------------",
              style: textTheme.headline3,
            ),
            Text(
              "-----------------------------",
              style: textTheme.headline3,
            ),
            Text("Normal call without states:"),
            Consumer(
              builder: (context, refWatcher, _) {
                final charactersWatcher = refWatcher.watch(
                  characterService.simpleNotifierCharactersProvider,
                );
                return charactersFirstName(context, charactersWatcher);
              },
            ),
            Text(
              "-----------------------------",
              style: textTheme.headline1,
            ),
            Text(
              "-----------------------------",
              style: textTheme.headline1,
            ),
            Text("Call with states:"),
            Consumer(
              builder: (context, refWatcher, _) {
                final charactersWatcher = refWatcher.watch(
                  characterService.asyncCharactersProvider,
                );
                return charactersWatcher.when(
                  data: (characters) =>
                      charactersFirstName(context, characters),
                  loading: () => Text("Loading async ...."),
                  error: (_, __) => Text("Error"),
                );
              },
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                characterService.nextPage(ref);
              },
              child: Text(
                "Load next page",
                textAlign: TextAlign.center,
              ),
            ),
            Images.appLogo.get(
              width: 250,
            )
          ],
        ),
      ),
    );
  }

  Widget charactersFirstName(BuildContext context, List<Character?>? items) {
    if (items!.isNotEmpty == true) {
      return Text(
        'Value: ${items[0]!.name}',
        style: theme.textTheme.bodyText1,
      );
    } else {
      return Text(
        context.getString(Localize.welcome_message),
        style: theme.textTheme.bodyText1,
      );
    }
  }
}
