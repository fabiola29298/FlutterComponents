import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_app1/src/pages/alert_page.dart';
import 'package:flutter_app1/src/routes/routes.dart';
 void main() => runApp(MyApp());
  
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Componentes App',
       debugShowCheckedModeBanner: false, // no mostrar el logo de debug

      //*** idioma espanol para la fecha */
       localizationsDelegates: [
         GlobalMaterialLocalizations.delegate,
         GlobalMaterialLocalizations.delegate
       ],
       supportedLocales: [
         const Locale('en', 'US'), //English
         const Locale('es', 'ES'), //Espanol

       ],

       initialRoute: '/', //ruta de inicio
       routes: getAplicationRoutes(), //rutas de las paginas
       onGenerateRoute: (setting){ // funcion de la ruta por DEFECTO
         return MaterialPageRoute(builder: (context)=>AlertPage());
       },


     );
   }
 }