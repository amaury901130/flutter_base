import 'package:device/globals/_globals.dart';
import 'package:device/platform/abstract/platform_info.dart';

abstract class AppPlatform {
  static AppPlatform get instance => getIt<AppPlatform>();

  static void register(AppPlatform platform) =>
      getIt.registerSingleton<AppPlatform>(platform);

  get isWeb => false;

  get isMacOS => false;

  get isFuchsia => false;

  get isLinux => false;

  get isWindows => false;

  get isIOS => false;

  get isAndroid => false;

  PlatformType get currentPlatform => isWeb
      ? PlatformType.Web
      : isMacOS
          ? PlatformType.MacOS
          : isFuchsia
              ? PlatformType.Fuchsia
              : isLinux
                  ? PlatformType.Linux
                  : isWindows
                      ? PlatformType.Windows
                      : isIOS
                          ? PlatformType.iOS
                          : isAndroid
                              ? PlatformType.Android
                              : PlatformType.Unknown;
}
