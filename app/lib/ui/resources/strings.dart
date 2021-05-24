part of 'r.dart';

enum Strings {
  welcome_message,
}

// use %ns for interpolation example: %1s, %2s
const Map<Strings, String> _localization = {
  Strings.welcome_message: 'hello Flutter',
};

extension LocalizationString on Strings {
  String? get value => _localization[this];
}

extension LocalizationParams on String {
  String parse({List<String>? withParams}) {
    var localText = this;

    if (withParams == null) {
      return localText;
    }

    for (int i = 1; i < withParams.length + 1; i++) {
      localText = localText.replaceAll('%${i}s', withParams[i - 1]);
    }

    return localText;
  }
}
