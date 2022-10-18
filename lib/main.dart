import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:song_book/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bodo Gospel Song Book',
      debugShowCheckedModeBanner: false,
      // initialBinding: ControllerBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: Routes.routes,
    );
  }
}
