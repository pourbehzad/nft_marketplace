import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_marketplace/getStarted/get_started_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFF211134),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Marketplace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF211134),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF211134),
          elevation: 0,
        ),
      ),
      home: GetStartedScreen(), 
    );
  }
}
