import 'helpers/go_router_helper.dart';
import 'package:flutter/services.dart';

import 'gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const int _tealbaseprimaryPrimaryValue = 0xFF5956E9;

const MaterialColor tealBasePrimary =
    MaterialColor(_tealbaseprimaryPrimaryValue, <int, Color>{
  50: Color(0xFFEBEBFC),
  100: Color(0xFFCDCCF8),
  200: Color(0xFFACABF4),
  300: Color(0xFF8B89F0),
  400: Color(0xFF726FEC),
  500: Color(_tealbaseprimaryPrimaryValue),
  600: Color(0xFF514FE6),
  700: Color(0xFF4845E3),
  800: Color(0xFF3E3CDF),
  900: Color(0xFF2E2BD9),
});

const systemUIOverlay = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
  statusBarColor: Colors.transparent,
);

void main() {
  SystemChrome.setSystemUIOverlayStyle(systemUIOverlay);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        title: 'Ecom Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: tealBasePrimary,
          fontFamily: FontFamily.raleway,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ScrollConfiguration(
            behavior: _NoScrollBehavior(),
            child: child!,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}

class _NoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}
