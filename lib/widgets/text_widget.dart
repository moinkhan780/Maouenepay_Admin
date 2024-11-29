import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;
  final int? maxLines;
  final double? height;

  const TextWidget(
    this.text, {
    super.key,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontSize = 14,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize.spMin,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

class RichTextWidget extends StatelessWidget {
  final List<TextSpanWidget> children;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final int maxLines;
  final TextOverflow overflow;

  const RichTextWidget({
    super.key,
    required this.children,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontSize = 14,
    this.maxLines = 1000,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    final textSpans = children.map((child) => child.toTextSpan()).toList();

    return RichText(
      maxLines: maxLines,
      overflow: overflow,
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize.spMin,
          fontWeight: fontWeight,
          color: color,
        ),
        children: textSpans,
      ),
    );
  }
}

class TextSpanWidget {
  final String text;

  final FontWeight fontWeight;
  final Color color;
  final double fontSize;

  TextSpanWidget({required this.text, this.fontWeight = FontWeight.normal, this.color = kBlack, this.fontSize = 14});

  TextSpan toTextSpan() {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: fontSize.spMin,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
