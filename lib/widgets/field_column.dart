import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maouenepay_admin/widgets/text_widget.dart';

class FieldColumn extends StatelessWidget {
  final String text;
  final Widget child;
  final Widget? info;

  const FieldColumn({
    super.key,
    required this.text,
    required this.child,
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            info ?? const SizedBox(),
          ],
        ),
        const Gap(5),
        child
      ],
    );
  }
}
