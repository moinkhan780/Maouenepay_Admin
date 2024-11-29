import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maouenepay_admin/providers/navigation_provider.dart';
import 'package:maouenepay_admin/router/app_router.dart';
import 'package:maouenepay_admin/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(width, height),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
          title: 'Maouenepay Admin',
          theme: appTheme,
        );
      },
    );
  }
}
