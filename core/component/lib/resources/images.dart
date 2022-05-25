part of 'r.dart';

enum Images { appLogo }

const imagesResFolder = "images";
// const icResFolder = "icons";

const Map<Images, String> _imagesValues = {
  Images.appLogo: '$imagesResFolder/app_logo.png'
};

extension LoadImage on Images {
  String get value => _imagesValues[this]!;

  Widget svg({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    Alignment alignment = Alignment.center,
    String? semanticLabel,
  }) =>
      _SvgImage.asset(
        this.value,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        semanticLabel: semanticLabel,
      );

  Image get({
    Key? key,
    double? scale,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
  }) =>
      Image.asset(
        this.value,
        height: width,
        width: width,
        scale: scale,
        fit: fit,
        alignment: alignment,
      );

  AssetImage assetImage() => AssetImage(this.value);
}

class _SvgImage {
  static Widget asset(
    String assetPath, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    Alignment alignment = Alignment.center,
    String? semanticLabel,
    String? package,
    @visibleForTesting bool isWeb = false,
  }) {
    return SvgPicture.asset(
      assetPath,
      key: Key(assetPath),
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      semanticsLabel: semanticLabel,
      package: package,
    );
  }
}
