import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart' as messages;

class HomePageLocalizations {
  final String _localeName;

  HomePageLocalizations(this._localeName);

  static Future<HomePageLocalizations> load(Locale locale) {
    final String localeName = Intl.canonicalizedLocale(locale.languageCode);
    return messages.initializeMessages(localeName).then((_) {
      return HomePageLocalizations(localeName);
    });
  }

  static HomePageLocalizations of(BuildContext context) {
    return Localizations.of<HomePageLocalizations>(
        context, HomePageLocalizations);
  }

  String get pythonTest {
    return Intl.message('python test message',
        name: 'pythonTest',
        desc: 'Test message to show how localization works in flutter',
        locale: _localeName);
  }

  String get exampleMessage {
    return Intl.message('Example localization message',
        name: 'exampleMessage',
        desc: 'Test message to show how localization works in flutter',
        locale: _localeName);
  }
}

class HomePageLocalizationsDelegate
    extends LocalizationsDelegate<HomePageLocalizations> {
  // const constructors: https://stackoverflow.com/a/21746692/7516134
  // In some case it is a more advance singleton
  final Iterable<Locale> supportedLocales;
  const HomePageLocalizationsDelegate(this.supportedLocales);

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  Future<HomePageLocalizations> load(Locale locale) =>
      HomePageLocalizations.load(locale);

  // https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/shouldReload.html
  @override
  bool shouldReload(LocalizationsDelegate<HomePageLocalizations> old) => false;
}
