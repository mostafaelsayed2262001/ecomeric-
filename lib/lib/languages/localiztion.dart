import 'package:ecomerec/lib/languages/ar.dart';
import 'package:ecomerec/lib/languages/en.dart';
import 'package:ecomerec/lib/languages/fr.dart';
import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:get/route_manager.dart';


class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        arr: ar,
        frn: fr,
      };
}
