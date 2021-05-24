import 'package:repository/globals/globals.dart';

class RepoPreferences {
  static RepoPreferences get instance => getIt<RepoPreferences>();

  static void register(RepoPreferences repo) =>
      getIt.registerSingleton<RepoPreferences>(repo);
}
