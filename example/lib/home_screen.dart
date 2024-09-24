import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_text_field/main_text_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String? textField1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 12),
            Form(
              key: formKey,
              child: Column(
                children: [
                  // MainTextField(
                  //   isUnderLineBorder: false,
                  //   contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  //   labelText: 'ddddd',
                  //   initialValue: 'welcome',
                  //   onSave: (val) => textField1 = val,
                  // ),
                  // const SizedBox(height: 12),
                  MainTextField.email(
                    decorationType: DecorationType.filled,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    labelText: 'email',
                    onSave: (val) => textField1 = val,
                  ),
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        log('textField1 => $textField1');
                      }
                    },
                    child: const Text('send'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
