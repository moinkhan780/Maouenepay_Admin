import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';
import 'package:maouenepay_admin/widgets/buttons.dart';
import 'package:maouenepay_admin/widgets/input_decoration.dart';

class AddBusiness extends StatefulWidget {
  const AddBusiness({super.key});

  @override
  State<AddBusiness> createState() => _AddBusinessState();
}

class _AddBusinessState extends State<AddBusiness> {
  final _formKey = GlobalKey<FormState>();

  final _companyNameController = TextEditingController();
  final _activityAreaController = TextEditingController();
  final _accountNumberController = TextEditingController();

  // Placeholder for image
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business"),
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
                  _circleImage(),
                  const Gap(16),
                  _companyNameField(),
                  const Gap(16),
                  _activityAreaField(),
                  const Gap(16),
                  _accountNumberField(),
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

  Widget _circleImage() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? const Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.grey,
                )
              : null,
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Widget _companyNameField() {
    return TextFormField(
      controller: _companyNameController,
      decoration: inputDecoration(hintText: "Company Name"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Company name is required";
        }
        return null;
      },
    );
  }

  Widget _activityAreaField() {
    return TextFormField(
      controller: _activityAreaController,
      decoration: inputDecoration(hintText: "Activity Area"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Activity area is required";
        }
        return null;
      },
    );
  }

  Widget _accountNumberField() {
    return TextFormField(
      controller: _accountNumberController,
      decoration: inputDecoration(hintText: "Account Number"),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Account number is required";
        }
        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return "Enter a valid account number";
        }
        return null;
      },
    );
  }
}
