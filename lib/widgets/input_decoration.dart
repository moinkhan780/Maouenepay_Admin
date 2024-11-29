import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maouenepay_admin/theme/colors.dart';

InputDecoration inputDecoration({
  String? hintText,
  String? labelText,
  Color? labelColor,
  String? prefixText,
  bool isDense = false,
  double verticalPadding = 20.0,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    labelText: labelText,
    hintText: hintText,
    alignLabelWithHint: true,
    fillColor: inputDecorationColor,
    filled: true,
    prefixText: prefixText,
    isDense: isDense,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kBorder, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: verticalPadding),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.spMin,
      color: kHint,
    ),
    labelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.spMin,
      color: kHint,
    ),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.spMin,
      color: kHint,
    ),
    prefixIconColor: kGreyText,
    suffixIconColor: kGreyText,
    prefixStyle: TextStyle(
      fontSize: 16.spMin,
      color: kBlack,
    ),
  );
}

InputDecoration inputDecoration2({
  String? hintText,
  String? labelText,
  Color? labelColor,
  String? prefixText,
  bool isDense = false,
  double verticalPadding = 18.0,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    labelText: labelText,
    hintText: hintText,
    alignLabelWithHint: true,
    fillColor: kGreyBackground,
    filled: true,
    prefixText: prefixText,
    isDense: isDense,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: kBorder, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    // contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: verticalPadding),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15.spMin,
      color: kHint,
    ),
    labelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15.spMin,
      color: kHint,
    ),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15.spMin,
      color: kHint,
    ),
    prefixIconColor: kGreyText,
    suffixIconColor: kGreyText,
    suffixStyle: TextStyle(
      fontSize: 15.spMin,
      color: kBlack,
    ),
    prefixStyle: TextStyle(
      fontSize: 15.spMin,
      color: kBlack,
    ),
    suffixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 0),
    prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 0),
  );
}
