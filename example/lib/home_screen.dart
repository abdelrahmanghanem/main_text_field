import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_text_field/main_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  // String? textField1;
  // String? email;
  // String? password;
  //
  // String? phone;
  // String? confirmPassword;
  //
  // bool get isAnyFieldEmpty =>
  //     isEmailEmpty || isPasswordEmpty || isConfirmPasswordEmpty;
  //
  // bool isEmailEmpty = true;
  // bool isPasswordEmpty = true;
  // bool isConfirmPasswordEmpty = true;

  String? phone;
  String? countryCode;
  String initialCountryCode = '+20';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MainTextField(
              //   title: 'MainTextField',
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              //   initialValue: 'welcome',
              //   isRequired: false,
              //   onSaved: (val) => textField1 = val,
              // ),
              // MainTextField.email(
              //   onChanged: (val) => setState(() {
              //     email = val;
              //     isEmailEmpty = email?.isEmpty ?? true;
              //   }),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // MainTextField.password(
              //   onChanged: (val) => setState(() {
              //     password = val;
              //     isPasswordEmpty = password?.isEmpty ?? true;
              //   }),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // MainTextField.confirmPassword(
              //   passwordValue: password,
              //   onChanged: (val) => setState(() {
              //     confirmPassword = val;
              //     isConfirmPasswordEmpty = confirmPassword?.isEmpty ?? true;
              //   }),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // MainTextField.number(
              //   onSaved: (val) => number = val,
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              MainTextField.phone(
                initialCountryCode: initialCountryCode,
                textInputFormatter: [],
                onChangedCountryCode: (value) {
                  countryCode = value.toString();
                },
                onChanged: (val) => phone = val,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    log('number => ${countryCode ?? initialCountryCode}$phone');
                  }
                },
                // onPressed: isAnyFieldEmpty
                //     ? null
                //     : () {
                //         if (formKey.currentState?.validate() ?? false) {
                //           log('email => $email');
                //           log('password => $password');
                //           log('confirmPassword => $confirmPassword');
                //           log('number => $number');
                //         }
                //       },
                child: const Text(
                  'Send',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
