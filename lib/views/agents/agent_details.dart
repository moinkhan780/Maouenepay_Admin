import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';
import 'package:maouenepay_admin/widgets/buttons.dart';
import 'package:maouenepay_admin/widgets/input_decoration.dart';

class AgentDetails extends StatefulWidget {
  const AgentDetails({super.key});

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agent Details"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 1000,
          child: SingleChildScrollView(
            padding: Responsive.getAllPadding(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _emailField(),
                  const Gap(16),
                  _passwordField(),
                  const Gap(16),
                  _usernameField(),
                  const Gap(16),
                  _phoneNumberField(),
                ],
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        CustomButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Perform save operation
            }
          },
          text: "Save",
        ),
      ],
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      decoration: inputDecoration(hintText: "Email"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email is required";
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "Enter a valid email";
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _passwordController,
      decoration: inputDecoration(hintText: "Password"),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters long";
        }
        return null;
      },
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: inputDecoration(hintText: "Username"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Username is required";
        }
        return null;
      },
    );
  }

  Widget _phoneNumberField() {
    return TextFormField(
      controller: _phoneNumberController,
      decoration: inputDecoration(hintText: "Phone Number"),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone number is required";
        }
        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return "Enter a valid phone number";
        }
        return null;
      },
    );
  }
}
