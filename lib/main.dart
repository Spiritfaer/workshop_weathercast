import 'package:flutter/material.dart';

import 'components/home_page.dart';
import 'components/my_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weathercast demo',
      theme: myTheme(),
      home: HomePage(),
    );
  }
}
