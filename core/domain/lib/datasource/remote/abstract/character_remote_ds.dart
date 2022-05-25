import 'package:domain/globals/_globals.dart';
import 'package:domain/models/character.dart';

abstract class CharacterRemoteDS {
  static CharacterRemoteDS get instance => getIt<CharacterRemoteDS>();

  static void register(CharacterRemoteDS remoteDS) =>
      getIt.registerSingleton<CharacterRemoteDS>(remoteDS);

  Future<List<Character?>?> getCharacters();
}
