import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi or rtl
      ],
      theme: ThemeData(
        fontFamily: 'Vazir',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 14,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 16,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w500,
          ),
          headline3: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 14,
            color: Color.fromARGB(255, 40, 107, 184),
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 14,
            color: Color.fromARGB(250, 0, 0, 0),
            fontWeight: FontWeight.w700,
          ),
          headline5: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 16,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
