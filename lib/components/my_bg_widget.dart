import 'package:flutter/material.dart';

class MyBgWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[Colors.blue, Colors.red],
        ),
      ),
    );
  }
}
