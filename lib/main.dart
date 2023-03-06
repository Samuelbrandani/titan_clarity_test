import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/infra/infra.dart';
import 'app/presentation_layer/app_module.dart';
import 'app/presentation_layer/app_widget.dart';

void main() => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await EnvConfig.init();

        runApp(
          ModularApp(
            module: AppModule(),
            child: const AppWidget(),
          ),
        );
      },
      (error, stack) => debugPrint('$error, $stack'),
    );
