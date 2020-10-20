import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quest_creator/pages/home_page/home_page.localizations.dart';
import 'package:quest_creator/pages/main_screen.dart';

void main() {
  runApp(QuestCreator());
}

class QuestCreator extends StatelessWidget {
  static const List<Locale> SupportedLocales = [
    const Locale.fromSubtags(languageCode: 'en'),
    const Locale.fromSubtags(languageCode: 'pl')
  ];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale:
          SupportedLocales.firstWhere((locale) => locale.languageCode == 'en'),
      localizationsDelegates: [
        const HomePageLocalizationsDelegate(SupportedLocales),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: SupportedLocales,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
