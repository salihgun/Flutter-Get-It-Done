import 'package:flutter/material.dart';
import 'package:fluttergetitdone/models/items_data.dart';
import 'package:fluttergetitdone/models/theme_color_data.dart';
import 'package:fluttergetitdone/screens/setting_page.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeColorData().createSharedPref();
  await ItemData().createItemSharedPref();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(create: (context) => ItemData()),
    ChangeNotifierProvider<ThemeColorData>(
      create: (context) => ThemeColorData(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ItemData, ThemeColorData>(
      builder: (context, itemData, themeColorData, child) {
        itemData.loadItemSharedPref();
        themeColorData.getSharedPref();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeColorData>(context).selectedThemeData,
          home: SplashWidget(),
        );
      },
    );
  }
}

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Get it Done',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Theme.of(context).primaryColor),
      ),
      backgroundColor: ThemeData.dark().primaryColor,
    );
  }
}
