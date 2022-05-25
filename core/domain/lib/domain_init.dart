import 'package:domain/client/rest_client.dart';
import 'package:domain/datasource/remote/abstract/character_remote_ds.dart';
import 'package:domain/datasource/remote/concrete/_character_remote_ds.dart';
import 'package:domain/globals/_domain_preferences.dart';
import 'package:domain/globals/_globals.dart';
import 'package:domain/repo/abstract/character_repo.dart';
import 'package:domain/repo/concrete/_character_repo.dart';
import 'package:domain/services/abstract/character_service.dart';
import 'package:domain/services/concrete/_character_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * Run: flutter pub run build_runner build
 * to generate the json model parse and the http client when needed.
 * **/
class Domain {
  static Future<void> initialize() async {
    repoPreferences = await SharedPreferences.getInstance();
    DomainPreferences.register();
    CharacterService.register(CharacterServiceImp());
    RestClient.initialize();
    CharacterRemoteDS.register(CharacterRemoteDSImpl());
    CharacterRepo.register(CharacterRepoImp());
  }
}
