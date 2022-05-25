import 'package:domain/globals/_globals.dart';
import 'package:domain/models/character.dart';

abstract class CharacterRepo {
  static CharacterRepo get instance => getIt<CharacterRepo>();

  static void register(CharacterRepo repo) =>
      getIt.registerSingleton<CharacterRepo>(repo);

  Future<List<Character?>?> loadCharacters();
}
