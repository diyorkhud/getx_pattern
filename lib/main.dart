import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/pages/home_page.dart';
import 'package:getx_pattern/pages/main_page.dart';
import 'package:getx_pattern/pages/post_page.dart';
import 'package:getx_pattern/pages/splash_page.dart';
import 'package:getx_pattern/pages/starter_page.dart';
import 'package:getx_pattern/pages/update_page.dart';
import 'package:getx_pattern/services/bind_service.dart';
import 'package:getx_pattern/services/di_service.dart';

void main() async{
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StarterPage(),
      routes: {
        '/postPage': (context) => const PostPage(),
        '/updatePage': (context) => UpdatePage(title: '', body: ''),
      },
      // initialBinding: BindService(),
      // getPages: [
      //   GetPage(name: MainPage.id, page: () => const MainPage(), binding: BindService(),),
      // ],
    );
  }
}
