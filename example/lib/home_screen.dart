import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_text_field/main_text_field.dart';
import 'package:main_widgets/main_widgets.dart';
import 'package:smart_localize/smart_localize.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  String? textField1;
  String? email;
  String? password;

  String? number;
  String? confirmPassword;

  bool get isAnyFieldEmpty =>
      isEmailEmpty || isPasswordEmpty || isConfirmPasswordEmpty;

  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;
  bool isConfirmPasswordEmpty = true;

  String? phone;
  String? countryCode;
  String initialCountryCode = '+20';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SmartLocalize.home),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // MainTextField(
              //   // maxWidth: 700,
              //   isRequired: false,
              //   onSaved: (val) => textField1 = val,
              // ),
              MainTextField.email(
                // maxWidth: 500,
                showPrefixIcon: true,
                onChanged: (val) => setState(() {
                  email = val;
                  isEmailEmpty = email?.isEmpty ?? true;
                }),
              ),
              MainTextField.password(
                // maxWidth: 500,
                onChanged: (val) => setState(() {
                  password = val;
                  isPasswordEmpty = password?.isEmpty ?? true;
                }),
              ),
              MainTextField.confirmPassword(
                // maxWidth: 500,
                passwordValue: password,
                onChanged: (val) => setState(() {
                  confirmPassword = val;
                  isConfirmPasswordEmpty = confirmPassword?.isEmpty ?? true;
                }),
              ),
              // MainTextField.number(
              //   maxWidth: 500,
              //   onSaved: (val) => number = val,
              // ),
              MainTextField.phone(
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
                onPressed: isAnyFieldEmpty
                    ? null
                    : () {
                        if (formKey.currentState?.validate() ?? false) {
                          log('phone => ${countryCode ?? initialCountryCode}$phone');
                          log('email => $email');
                          log('password => $password');
                          log('confirmPassword => $confirmPassword');
                          log('number => $number');
                          context.push(Screen1());
                        }
                      },
                child: Text(
                  SmartLocalize.submit,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Column(
        children: [Text('Hello from Screen 1')],
      ),
    );
  }
}
