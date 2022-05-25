import 'package:device/platform/concrete/_app_platform.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocalPlatform extends AppPlatform {
  @override
  bool isWeb = kIsWeb;
}
