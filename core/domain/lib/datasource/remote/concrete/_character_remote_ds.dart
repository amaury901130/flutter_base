import 'package:domain/datasource/remote/abstract/character_remote_ds.dart';
import 'package:domain/datasource/remote/_base_remote.dart';
import 'package:domain/models/character.dart';

class CharacterRemoteDSImpl extends BaseRemote implements CharacterRemoteDS {
  var page = 1;

  @override
  Future<List<Character?>?> getCharacters() async {
    final charactersResponse = await apiClient.getCharacters(page++);
    return charactersResponse.results;
  }
}
