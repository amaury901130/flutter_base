import 'package:domain/globals/_globals.dart';

class RepoPreferences {
  static RepoPreferences get instance => getIt<RepoPreferences>();

  static void register() =>
      getIt.registerSingleton<RepoPreferences>(RepoPreferences._());

  RepoPreferences._();
}
