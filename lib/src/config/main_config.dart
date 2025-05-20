import 'package:flutter/material.dart';

import 'config_model.dart';

export 'config_model.dart';

class MainTextFiledConfigProvider extends InheritedWidget {
  final ConfigModel config;

  const MainTextFiledConfigProvider({
    super.key,
    required this.config,
    required super.child,
  });

  static ConfigModel of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<MainTextFiledConfigProvider>()
            ?.config ??
        const ConfigModel(defaultWidth: 370, defaultHeight: 44);
  }

  @override
  bool updateShouldNotify(MainTextFiledConfigProvider oldWidget) {
    return config != oldWidget.config;
  }
}
