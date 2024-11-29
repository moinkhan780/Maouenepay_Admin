import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maouenepay_admin/theme/colors.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  splashFactory: NoSplash.splashFactory,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      size: 24.spMin,
      color: Colors.black,
    ),
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18.spMin,
      color: Colors.black,
    ),
    toolbarHeight: Responsive.isMobile() ? null : 100,
  ),
  dialogBackgroundColor: Colors.white,
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      // side: BorderSide(
      //   color: kBorder,
      // ),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  dividerColor: kBorder,
  dividerTheme: const DividerThemeData(color: kBorder),
  listTileTheme: const ListTileThemeData(
    minLeadingWidth: 0,
  ),
  iconTheme: IconThemeData(size: 24.spMin, color: kBlack),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kBorder, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kBorder, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kBorder, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.spMin,
      color: kHint,
    ),
    labelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.spMin,
      color: kHint,
    ),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.spMin,
      color: kHint,
    ),
    prefixIconColor: kBlack,
    suffixIconColor: kBlack,
    prefixStyle: TextStyle(
      fontSize: 16.spMin,
      color: kBlack,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  // cursor color
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: kPrimaryColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kPrimaryColor,
  ),
  fontFamily: "Poppins",
  colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return kSecondaryColor;
      }
      return null;
    }),
  ),
);
