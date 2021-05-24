import 'package:get_it/get_it.dart';
import 'package:repository/repo/business_repo.dart';
import 'package:repository/repoImp/business_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
late SharedPreferences globalPreferences;

class Repo {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    BusinessRepo.register(BusinessRepoImp());
  }
}
