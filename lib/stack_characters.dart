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
    final backgroundImage = random.nextBool();

    List<Widget> stackContent = [
      Container(
        color: Colors.amber.shade50,
        child: backgroundImage
            ? Image.asset(
                "images/paper.jpeg",
                fit: BoxFit.cover,
                height: double.infinity,
              )
            : null,
      ),
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

/* Using a for-in loop

class _StackCharactersState extends State<StackCharacters> {
  void refreshStack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final characters = '''故人西辞黄鹤楼，烟花三月下扬州。
    孤帆远影碧空尽，唯见长江天际流。'''
        .split('');
    final random = Random();
    final topMax = 600.0;
    final leftMax = 400.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Stack of Characters"),
      ),
      body: Stack(
        children: <Widget>[
          Container(color: Colors.amber.shade50),
          for (var char in characters)
            Positioned(
              child: Opacity(
                opacity: random.nextDouble() * 1.0,
                child: Text(
                  char,
                  style: TextStyle(fontSize: (0.3 + random.nextDouble()) * 96),
                ),
              ),
              top: random.nextDouble() * topMax,
              left: random.nextDouble() * leftMax),
            ),
          // I kind of miss an 'end-for' here.
        ]
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: refreshStack),
    );
  }
}

*/

/* Using a while loop

class _StackCharactersState extends State<StackCharacters> {
  void refreshStack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final characters = '''故人西辞黄鹤楼，烟花三月下扬州。
    孤帆远影碧空尽，唯见长江天际流。'''
        .split('');
    final random = Random();
    final topMax = 600.0;
    final leftMax = 400.0;
    var index = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Stack of Characters"),
      ),
      body: Stack(
        children: <Widget>[
          Container(color: Colors.amber.shade50),
          while i < characters.length
            Positioned(
              child: Opacity(
                opacity: random.nextDouble() * 1.0,
                child: Text(
                  char,
                  style: TextStyle(fontSize: (0.3 + random.nextDouble()) * 96),
                ),
              ),
              top: random.nextDouble() * topMax,
              left: random.nextDouble() * leftMax),
            ),
            i++;
        ]
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: refreshStack),
    );
  }
}

*/
