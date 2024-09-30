import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_text_field/main_text_field.dart';

import 'header_widget.dart';

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
              const HeaderWidget(
                title: 'MainTextField',
              ),
              MainTextField(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                width: 120,
                initialValue: 'welcome',
                isRequired: true,
                onSave: (val) => textField1 = val,
              ),
              const HeaderWidget(
                title: 'Email',
              ),
              MainTextField.email(
                onChanged: (val) => setState(() {
                  email = val;
                  isEmailEmpty = email?.isEmpty ?? true;
                }),
              ),
              const HeaderWidget(
                title: 'Password',
              ),
              MainTextField.password(
                radius: 20,
                width: 300,
                prefixIcon: const Icon(Icons.close),
                onChanged: (val) => setState(() {
                  password = val;
                  isPasswordEmpty = password?.isEmpty ?? true;
                }),
              ),
              const HeaderWidget(
                title: 'Confirm Password',
              ),
              MainTextField.confirmPassword(
                passwordValue: password,
                isRequired: true,
                radius: 20,
                width: 300,
                prefixIcon: const Icon(Icons.close),
                // contentPadding: const EdgeInsets.symmetric(horizontal: ),
                onChanged: (val) => setState(() {
                  confirmPassword = val;
                  isConfirmPasswordEmpty = confirmPassword?.isEmpty ?? true;
                }),
              ),
              const HeaderWidget(
                title: 'Number',
              ),
              MainTextField.number(
                radius: 10,
                width: 300,
                decorationType: DecorationType.filled,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                onSaved: (val) => number = val,
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
                          log('email => $email');
                          log('password => $password');
                          log('confirmPassword => $confirmPassword');
                          log('number => $number');
                        }
                      },
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
