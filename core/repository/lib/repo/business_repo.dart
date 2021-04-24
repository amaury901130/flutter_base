
import 'package:repository/repo_init.dart';
import 'package:repository/models/business.dart';

abstract class BusinessRepo {
  static BusinessRepo get instance => getIt<BusinessRepo>();

  static void register(BusinessRepo repo) {
    getIt.registerSingleton<BusinessRepo>(repo);
  }

  Future<Business> getById(String id);

  Future<List<Business>> getByLocation(double latitude, double longitude);

  Future<List<Business>> search(String query);
}
