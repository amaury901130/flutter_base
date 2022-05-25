import 'package:domain/datasource/remote/abstract/character_remote_ds.dart';
import 'package:domain/models/character.dart';
import 'package:domain/repo/abstract/character_repo.dart';

class CharacterRepoImp implements CharacterRepo {
  CharacterRemoteDS get characterRemoteDS => CharacterRemoteDS.instance;

  //TODO: manage pagination
  @override
  Future<List<Character?>?> loadCharacters() async {
    return await characterRemoteDS.getCharacters();
  }
}
