part of 'r.dart';

extension LocalizationString on Localize {
  String get value => localize[Localization.instance.currentLang]![this] ?? '';
}

extension LocalizationParams on String {
  String parse({required List<String> withParams}) {
    var localText = this;

    for (int i = 0; i < withParams.length; i++) {
      localText = localText.replaceAll('%${i + 1}s', withParams[i]);
    }

    return localText;
  }
}
