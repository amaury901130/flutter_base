import 'package:device/globals/_globals.dart';

abstract class PlatformInfo {
  static PlatformInfo get instance => getIt<PlatformInfo>();

  static void register(PlatformInfo platform) =>
      getIt.registerSingleton<PlatformInfo>(platform);

  bool get isDesktopOS;

  bool get isAppOS;

  bool get isWeb;

  bool get isAndroid;

  bool get isIOS;

  Future<String> get version;

  PlatformType get currentPlatform;

  String get getCurrentPlatformType;
}

enum PlatformType { Web, iOS, Android, MacOS, Fuchsia, Linux, Windows, Unknown }

extension PlatformTypeString on PlatformType {
  String get name => this.toString().split('.').last;
}
