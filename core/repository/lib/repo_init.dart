import 'package:repository/globals/globals.dart';
import 'package:repository/repo/abstract/business_repo.dart';
import 'package:repository/repo/concrete/business_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repo {
  static Future<void> initialize() async {
    repoPreferences = await SharedPreferences.getInstance();
    BusinessRepo.register(BusinessRepoImp());
  }
}
