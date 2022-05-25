import 'package:device/file_manager/abstract/file_manager.dart';
import 'package:device/file_manager/concrete/_file_manager.dart';
import 'package:device/globals/_device_preferences.dart';
import 'package:device/globals/_globals.dart';
import 'package:device/platform/abstract/platform_info.dart';
import 'package:device/platform/concrete/_app_platform.dart';
import 'package:device/platform/concrete/_platform_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device/platform/concrete/_web_platform.dart'
    if (dart.library.io) 'package:device/platform/_mobile_desktop_platform.dart';

class Device {
  static Future<void> initialize() async {
    repoPreferences = await SharedPreferences.getInstance();
    AppPlatform.register(LocalPlatform());
    PlatformInfo.register(PlatformInfoImpl());
    FileManager.register(FileManagerImp());
    DevicePreferences.register();
  }
}
