import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maouenepay_admin/router/app_router.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';
import 'package:maouenepay_admin/widgets/buttons.dart';
import 'package:maouenepay_admin/widgets/input_decoration.dart';
import 'package:maouenepay_admin/widgets/text_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Widget _topText() {
    return const TextWidget(
      "Log In",
      fontWeight: FontWeight.w500,
      fontSize: 24,
    );
  }

  Widget _emailAddressField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: inputDecoration(hintText: "E-mail"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _passController,
      keyboardType: TextInputType.visiblePassword,
      decoration: inputDecoration(hintText: "Password"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        }
        return null;
      },
    );
  }

  Widget _loginButton() => CustomButton(
        onPressed: () {
          // if (_formKey.currentState!.validate()) {

          // }

          AppRoutes.router.goNamed(AppRoutes.SIDEBAR);
        },
        text: "To log in",
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/logo.png',
            height: 100.h,
            width: 100.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: Responsive.getAllPadding(16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Container(
              width: 500,
              padding: Responsive.getAllPadding(32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _topText(),
                    const Gap(40),
                    _emailAddressField(),
                    const Gap(20),
                    _passwordField(),
                    const Gap(40),
                    _loginButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
