
part of 'r.dart';

enum Strings {
  welcome_message,
}

// use %ns for params example: %1s
const Map<Strings, String> _localization = {
  Strings.welcome_message: 'hello Flutter',
};

extension LocalizationString on Strings {
  String valueWithData({List<String> params}) => this.l10n(params: params);

  String get value => _localization[this];

  String l10n({List<String> params}) {
    var localText = _localization[this];

    if (params == null) {
      return localText ?? this;
    }

    for (int i = 1; i < params.length + 1; i++) {
      localText = localText.replaceAll('%${i}s', params[i - 1]);
    }

    return localText;
  }
}
