import 'package:repository/globals/globals.dart';

class Preferences {
  static Preferences get instance => getIt<Preferences>();

  static void register(Preferences repo) =>
      getIt.registerSingleton<Preferences>(repo);
}
