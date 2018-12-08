import 'dart:math';

import 'package:flutter/material.dart';

class StackCharacters extends StatefulWidget {
  @override
  _StackCharactersState createState() {
    return new _StackCharactersState();
  }
}

class _StackCharactersState extends State<StackCharacters> {
  void refreshStack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack of Characters"),
      ),
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
    final random = Random();
    final topMax = 600.0;
    final leftMax = 400.0;
    List<Widget> stackContent = [
      Container(color: Colors.amber.shade50),
    ];
    for (var char in characters) {
      var top = random.nextDouble() * topMax;
      var left = random.nextDouble() * leftMax;
      stackContent.add(Positioned(
          child: Opacity(
            opacity: random.nextDouble() * 1.0,
            child: Text(
              char,
              style: TextStyle(fontSize: (0.3 + random.nextDouble()) * 96),
            ),
          ),
          top: top,
          left: left));
    }
    return stackContent;
  }
}
