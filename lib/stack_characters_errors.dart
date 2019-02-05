import 'dart:math';

import 'package:flutter/material.dart';

class StackCharacters extends StatefulWidget {
  @override
  _StackCharactersState createState() {
    return new _StackCharactersState();
  }
}

class _StackCharactersState extends State<StackCharacters> {
  final random = Random();

  void refreshStack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: generateStackContent(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: refreshStack),
    );
  }

  List<Widget> generateStackContent() {
    final characters = '''故人西辞黄鹤楼，烟花三月下扬州。
    孤帆远影碧空尽，唯见长江天际流。'''
        .split('');

    List<Widget> stackContent = [
      Container(
        color: Colors.amber.shade50,
      ),
      /*
      if (random.nextBool()) {
        Positioned(
          child: Opacity(
              opacity: 0.5,
              child: FlutterLogo(
                size: 100,
              )),
          top: MediaQuery.of(context).size.height / 2 - 50,
          left: MediaQuery.of(context).size.width / 2 - 50,
        ),
        Positioned(
          child: Opacity(
              opacity: 0.5,
              child: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 80,
              )),
          bottom: 10,
          left: 10,
        ),
      }
      */
    ];
    for (var char in characters) {
      stackContent.add(Positioned(
        child: Opacity(
          opacity: random.nextDouble() * 1.0,
          child: Text(
            char,
            style: TextStyle(fontSize: (0.3 + random.nextDouble()) * 96),
          ),
        ),
        top: random.nextDouble() * MediaQuery.of(context).size.height,
        left: random.nextDouble() * MediaQuery.of(context).size.width,
      ));
    }

    return stackContent;
  }
}
