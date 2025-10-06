import 'package:flutter/material.dart';
 void main(){
   runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: ScreenNavigation(),
     );
   }
 }

 class ScreenNavigation extends StatefulWidget {
   const ScreenNavigation({super.key});
 
   @override
   State<ScreenNavigation> createState() => _ScreenNavigationState();
 }
 
 class _ScreenNavigationState extends State<ScreenNavigation> {
   @override
   Widget build(BuildContext context) {
     return const Placeholder();
   }
 }
 