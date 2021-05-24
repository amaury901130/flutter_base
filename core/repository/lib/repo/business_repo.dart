import 'package:repository/repo_init.dart';

abstract class BusinessRepo {
  static BusinessRepo get instance => getIt<BusinessRepo>();

  static void register(BusinessRepo repo) {
    getIt.registerSingleton<BusinessRepo>(repo);
  }
}
