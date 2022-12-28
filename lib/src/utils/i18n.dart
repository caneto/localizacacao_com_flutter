import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static final _t = Translations("en_us") +
      {
        "en_us": "No Address Found",
        "pt_br": "Nenhum endereço encontrado",
      } +
      {
        "en_us": "Get Current Location",
        "pt_br": "Obter localização atual",
      };

  String get i18n => localize(this, _t);
}