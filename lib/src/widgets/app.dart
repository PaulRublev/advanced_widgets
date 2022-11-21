import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  App({super.key});

  final ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ChangeNotifierProvider(
        create: (context) => themeChangeProvider,
        child: Consumer<ThemeProvider>(builder: (_, provider, ___) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: provider.currentTheme(),
            home: const HomePage(title: 'Weather'),
          );
        }),
      ),
    );
  }
}
