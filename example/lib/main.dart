import 'package:flutter/material.dart';
import 'package:main_text_field/main_text_field.dart';
import 'package:smart_localize/smart_localize.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTextFiledConfigProvider(
      config: const ConfigModel(defaultWidth: 250, defaultHeight: 50),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        locale: const Locale('en'),
        localeResolutionCallback: (locale, supportedLocales) =>
            locale ?? const Locale('ar'),
        localizationsDelegates: context.smartLocalizeDelegates,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
