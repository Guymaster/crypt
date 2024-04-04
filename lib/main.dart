import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crypt/common/themes.dart';
import 'package:crypt/pages/welcome/welcome.page.dart';
import 'package:crypt/pages/registry/registry.page.dart';
import 'package:crypt/providers/secret_key.provider.dart';
import 'package:crypt/services/database.dart';
import 'package:crypt/services/encryption.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  runApp(const MyApp());
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "Crypt";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SecretKeyProvider(),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme,
        home: const RegistryPage(),
      ),
    );
  }
}