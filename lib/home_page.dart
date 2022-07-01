import 'package:flutter/material.dart';
import 'package:flutter_localizations_app/app_localizations.dart';
import 'package:flutter_localizations_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     //   title: Text("${AppLocalization.of(context)!.translate('appBar_homePage')}"),
      ),
      body: Column(
        children: [
          Center(
              child: Text("${AppLocalization.of(context)!.translate('hallo')}",style: const TextStyle(fontSize: 25.0))
          ) ,

          MaterialButton(onPressed: () {
            showDialog(context: context, builder: (context)=>AlertDialog(
              actions: [
                MaterialButton(onPressed: (){
                  ref.read(provSwitch).toggleLang("en");
                },child: const Text("En"),),
                MaterialButton(onPressed: (){
                  ref.read(provSwitch).toggleLang("es");
                },child: const Text("Es"),),
                MaterialButton(onPressed: (){
                  ref.read(provSwitch).toggleLang("ar");
                },child: const Text("Ar"),),
              ],
            )
            );
          },child: const Text('Switch Language'))


        ]
      ),
    );
  }
}