import 'dart:convert';

import 'package:coincap/model/appConfig.dart';
import 'package:coincap/pages/home_page.dart';
import 'package:coincap/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHTTPService();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent = await rootBundle.loadString(
    "assets/config/main.json",
  );
  Map _configData = jsonDecode(_configContent);
  GetIt.instance.registerSingleton<Appconfig>(
    Appconfig(
      COIN_API_BASE_URL: _configData['COIN_API_BASE_URL'],
      API_KEY: _configData['API_KEY'],
    ),
  );
}

void registerHTTPService() {
  GetIt.instance.registerSingleton<HttpService>(HttpService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromRGBO(88, 60, 197, 1.0),
      ),
      home: HomePage(),
    );
  }
}
