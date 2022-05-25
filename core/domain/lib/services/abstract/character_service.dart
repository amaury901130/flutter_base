import 'package:domain/models/character.dart';
import 'package:domain/globals/_globals.dart';
import 'package:domain/services/notifiers/_characters_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CharacterService {
  static CharacterService get instance => getIt<CharacterService>();

  static void register(CharacterService service) =>
      getIt.registerSingleton<CharacterService>(service);

  late StateNotifierProvider<CharacterNotifier, List<Character?>?> simpleNotifierCharactersProvider;
  late StateNotifierProvider<CharacterNotifierAsync, AsyncValue<List<Character?>?>> asyncCharactersProvider;
  late AutoDisposeFutureProvider<List<Character?>?> futureCharactersProvider;

  void nextPage(WidgetRef reader);
}
