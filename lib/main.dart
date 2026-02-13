import 'package:flutter/material.dart';
import 'package:islamiapp/hadithdetails.dart';
import 'package:islamiapp/home_screen.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/most_recent_provider.dart';
import 'package:islamiapp/splash_screen.dart';
import 'package:islamiapp/sura_details.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => MostRecentprovider(),
      child: MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,

      initialRoute: AppRoutes.splash, // ✅ use this
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.main: (context) => HomeScreen(),
        AppRoutes.suradetails: (context) => SuraDetails(),
        AppRoutes.hadithdetails: (context) => hadithdetails(),

      },
    );
  }
}

class AppRoutes {
  static const String splash = '.';
  static const String main = '/';
  static const String suradetails = '/suradetails';
  static const String hadithdetails = '/hadithdetails';

}
