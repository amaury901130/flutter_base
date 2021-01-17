import 'package:agarrate/core/repository/repo/business_repo.dart';
import 'package:agarrate/core/repository/repoImp//business_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
SharedPreferences globalPreferences;

class Core {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    BusinessRepo.register(BusinessRepoImp());
  }
}
