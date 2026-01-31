import 'package:hamqrg/config/app_configs.dart';

class DeepLinkUtils {
  static String buildDeepLink(String path) {
    final site = '${AppConfigs.getSite()}/app-deeplink/$path';
    return site;
  }
}
