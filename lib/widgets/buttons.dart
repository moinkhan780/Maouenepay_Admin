import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maouenepay_admin/widgets/text_widget.dart';

import '../theme/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double? width;
  final bool? fullWidth;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.width,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth == true ? double.infinity : width,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: TextWidget(
          text,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class CustomMiniButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double? width;
  final bool? fullWidth;

  const CustomMiniButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.width,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth == true ? double.infinity : width,
      height: 40,
      child: FilledButton(
        style: FilledButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: TextWidget(
          text,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool? fullWidth;
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.fullWidth,
    this.color = kBlue,
    this.textColor = kBlue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: fullWidth == null ? null : MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1, color: kBlue),
          foregroundColor: textColor,
          backgroundColor: Colors.transparent,
        ),
        child: TextWidget(
          text,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final Color color;
  final Color textColor;
  final double? iconSize;
  final double? padding;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.color = kPrimaryColor,
    this.textColor = kPrimaryColor,
    this.iconSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        shape: const CircleBorder(),
        foregroundColor: textColor,
        backgroundColor: color,
        padding: EdgeInsets.all(padding ?? 16),
      ),
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: textColor,
        size: iconSize,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  // final Color color;
  final Color textColor;
  final double? width;
  final bool? fullWidth;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    // this.color = kPrimaryColor,
    this.textColor = Colors.black,
    this.width,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth == true ? double.infinity : width,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          // backgroundColor: color,
        ),
        onPressed: onPressed,
        child: TextWidget(
          text,
          fontWeight: FontWeight.w500,
          color: textColor,
          fontSize: 14,
        ),
      ),
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      fillColor: Colors.black,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          "assets/back_arrow.png",
          height: 10.h,
          width: 10.h,
        ),
      ),
    );
  }
}

class CustomAppBarIconButton extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback onPressed;
  final Color iconColor;
  final double iconSize;
  final Widget? customImage;

  const CustomAppBarIconButton({
    super.key,
    required this.onPressed,
    this.iconData,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
    this.customImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: onPressed,
        child: customImage != null
            ? Padding(
                padding: const EdgeInsets.all(7.0),
                child: customImage,
              )
            : Icon(
                iconData,
                color: iconColor,
                size: iconSize.spMin,
              ),
      ),
    );
  }
}
