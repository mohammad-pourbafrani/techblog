import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/view/article_screen.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/view/register_intro.dart';
import 'package:techblog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return textThem.headline1;
              }
              return textThem.subtitle1;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.colorSeeMore;
              }
              return SolidColors.primary;
            }),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2),
            ),
            filled: true,
            fillColor: Colors.white),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 16,
            color: SolidColors.posterTitle,
            fontWeight: FontWeight.w700,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 13,
            color: SolidColors.posterSubTitle,
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 14,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w300,
          ),
          headline3: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 14,
            color: SolidColors.colorSeeMore,
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
          headline6: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 14,
            color: SolidColors.colorHintText,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      // home: const SplashScreen(),
      home: const ArticleListScreen(),
    );
  }
}
