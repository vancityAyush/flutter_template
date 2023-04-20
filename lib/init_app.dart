import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_template/util/config/environment.dart';

initApp(EnvironmentType env) async {
  Environment.init(env);
  await EasyLocalization.ensureInitialized();
}
