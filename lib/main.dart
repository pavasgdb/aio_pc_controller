import 'package:flutter/material.dart';
import 'LayoutSelect.dart';
import 'HomeScreen.dart';
import 'WasdLayout.dart';
import 'RacingLayout.dart';
import 'Tilt.dart';
import 'Custom.dart';
import 'LoadCustom.dart';
import 'CustomLayout.dart';
import 'Controller.dart';
import 'Theme.dart';
import 'Trackpad.dart';
import 'config.dart';

void main() async {
  // modify with your true address/port
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Brightness brightness =
        WidgetsBinding.instance.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    if (darkModeOn)
      currentThemeColors = darkThemeColors;
    else
      currentThemeColors = lightThemeColors;

    var lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: currentThemeColors.primaryColor,
      accentColor: currentThemeColors.accentColor,
    );
    var darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: currentThemeColors.primaryColor,
      accentColor: currentThemeColors.accentColor,
    );

    return MaterialApp(
      theme: darkModeOn ? darkTheme : lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/layout_select': (context) => LayoutSelect(),
        '/wasd_layout': (context) => WasdLayout(),
        '/racing_layout': (context) => RacingLayout(),
        '/gyro': (context) => Gyro(),
        '/custom': (context) => Custom(),
        '/loadcustom': (context) => LoadCustom(),
        '/custom_layout': (context) => CustomLayout(),
        '/controller': (context) => Controller(),
        '/trackpad': (context) => Trackpad(),
      },
    );
  }
}
