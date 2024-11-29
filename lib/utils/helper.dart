import 'package:flutter/material.dart';
import 'package:maouenepay_admin/router/app_router.dart';

void popDrawer(BuildContext context) {
  if (MediaQuery.of(context).size.width < 960) {
    AppRoutes.router.pop();
  }
}
