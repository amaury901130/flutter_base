import 'package:device/globals/_globals.dart';

class DevicePreferences {
  static DevicePreferences get instance => getIt<DevicePreferences>();

  static void register() =>
      getIt.registerSingleton<DevicePreferences>(DevicePreferences._());

  DevicePreferences._();
}
