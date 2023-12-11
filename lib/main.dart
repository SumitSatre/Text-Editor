import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_editor/home/controllers/home_controller.dart';
import 'package:text_editor/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';

void main(){
  runApp( TextEditor() );
}

class TextEditor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeController()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         routes: AppRoutes.routes,
        initialRoute: MyHomePage.routeName,
      ),
    );
  }

}