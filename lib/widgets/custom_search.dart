import 'package:flutter/material.dart';
import 'package:maouenepay_admin/theme/colors.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';
import 'package:maouenepay_admin/widgets/input_decoration.dart';

class CustomSearchTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const CustomSearchTextField({super.key, this.onChanged});

  @override
  CustomSearchTextFieldState createState() => CustomSearchTextFieldState();
}

class CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.getAllPadding(16),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.text,
        decoration: inputDecoration(
          isDense: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6, top: 5, bottom: 5),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: kPrimaryColor,
                          size: 25,
                        ),
                        onPressed: () {
                          _controller.clear();
                          if (widget.onChanged != null) {
                            widget.onChanged!('');
                          }
                          setState(() {});
                        },
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: kPrimaryColor,
                          size: 25,
                        ),
                        onPressed: () {},
                      )),
          ),
          hintText: "Search",
        ),
        scrollPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).viewInsets.bottom),
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          setState(() {});
        },
      ),
    );
  }
}
