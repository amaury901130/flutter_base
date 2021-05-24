import 'package:repository/globals/globals.dart';

abstract class BusinessRepo {
  static BusinessRepo get instance => getIt<BusinessRepo>();

  static void register(BusinessRepo repo) =>
      getIt.registerSingleton<BusinessRepo>(repo);
}
