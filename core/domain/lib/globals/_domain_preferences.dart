import 'package:domain/globals/_globals.dart';

class DomainPreferences {
  static DomainPreferences get instance => getIt<DomainPreferences>();

  static void register() =>
      getIt.registerSingleton<DomainPreferences>(DomainPreferences._());

  DomainPreferences._();
}
