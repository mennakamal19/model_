import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_model/prescription/binding/tab_binding.dart';
import 'package:speech_model/prescription/views/tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: TabBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:TabBarScreen() ,
    );
  }
}
