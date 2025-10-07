import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Home',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: Colors.white,),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body:Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome! You have successfully logged in.',
          style: TextStyle(fontSize: 20.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/all_fields_form');
          },
          child: const Text('Go to All Fields Form'),
        ),
      ],
    ),
    ),
    );
  }
}