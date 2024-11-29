import 'package:maouenepay_admin/router/app_router.dart';

class SplashServices {
  static String userId = "";

  static Future initialize() async {
    if (userId == "") {
      AppRoutes.router.goNamed(AppRoutes.LOGIN);
    } else {
      AppRoutes.router.goNamed(AppRoutes.SIDEBAR);
    }
  }
}
