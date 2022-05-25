import 'dart:io';

import 'package:device/platform/concrete/_app_platform.dart';

class LocalPlatform extends AppPlatform {
  @override
  bool isWeb = false;
  @override
  bool isMacOS = Platform.isMacOS;
  @override
  bool isFuchsia = Platform.isFuchsia;
  @override
  bool isLinux = Platform.isLinux;
  @override
  bool isWindows = Platform.isWindows;
  @override
  bool isIOS = Platform.isIOS;
  @override
  bool isAndroid = Platform.isAndroid;
}
