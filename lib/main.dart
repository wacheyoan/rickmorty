import 'package:rickmorty/ui/home/home_page.dart';
import 'package:flutter/material.dart';

import 'ui/home/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget  {
  const MyApp({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}



