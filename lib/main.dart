import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations_app/app_localizations.dart';
import 'package:flutter_localizations_app/const_text.dart';
import 'package:flutter_localizations_app/home_page.dart';
import 'package:flutter_localizations_app/lang_prov.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale("en",""),
        Locale("es",""),
        Locale("ar","")
      ],
      locale: TextTranslate.switchLang(ref.watch(provSwitch).lang) ,
      //locale: ref.watch(provSwitch).lang ? const Locale('en','') : const Locale('ar',''),
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: ( currentLocal , supportedLocal ){
        if( currentLocal != null ){
          for( Locale loopLocal in supportedLocal ){
            if( currentLocal.languageCode == loopLocal.languageCode ){
              print(currentLocal.languageCode);
              print(currentLocal);
              return currentLocal;
            }
          }
        }
        print(supportedLocal.first);
        return supportedLocal.first;
      },
      home: HomePage(),
    );
  }
}

final provSwitch = ChangeNotifierProvider<LangState>((ref)=>LangState());