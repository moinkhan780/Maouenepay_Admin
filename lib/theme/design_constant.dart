import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive {
  static EdgeInsets getAllPadding(double value) {
    return EdgeInsets.all(value.w);
  }

  static EdgeInsets getOnlyPadding({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: left?.w ?? 0,
      top: top?.w ?? 0,
      right: right?.w ?? 0,
      bottom: bottom?.w ?? 0,
    );
  }

  static EdgeInsets getSymmetricPadding({
    double? horizontal,
    double? vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal?.r ?? 0,
      vertical: vertical?.w ?? 0,
    );
  }

  static bool isMobile() => 1.sw < 600;

  static bool isTablet() => 1.sw >= 600 && 1.sw < 1100;

  static bool isDesktop() => 1.sw >= 1100;
}
