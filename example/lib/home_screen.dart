import 'package:flutter/material.dart';
import 'package:main_text_field/main_text_field.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            MainTextFormField(
              isUnderLineBorder: false,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              label: 'ddddd',
              initialValue: 'welcome',
            ),
          ],
        ),
      ),
    );
  }
}
