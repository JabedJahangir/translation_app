import 'package:get/get.dart';
import 'translations.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'bn_BD': bnBD,
      };
}