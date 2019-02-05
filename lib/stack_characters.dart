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

    // Add two Flutter Logos randomly.
    if (random.nextBool()) {
      stackContent.add(
        Positioned(
          child: Opacity(
            opacity: 0.5,
            child: FlutterLogo(
              size: 100,
            ),
          ),
          top: MediaQuery.of(context).size.height / 2 - 50,
          left: MediaQuery.of(context).size.width / 2 - 50,
        ),
      );
      stackContent.add(
        Positioned(
          child: Opacity(
            opacity: 0.5,
            child: FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              size: 80,
            ),
          ),
          bottom: 10,
          left: 10,
        ),
      );
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
              top: random.nextDouble() * MediaQuery.of(context).size.height,
              left: random.nextDouble() * MediaQuery.of(context).size.width,
            ),
          // I kind of miss an 'end-for' here.

          // Add two Flutter Logs when there is no background image
          if (!hasBackgroundImage) ...[
            Positioned(
              child: Opacity(
                  opacity: 0.5,
                  child: FlutterLogo(
                    size: 100,
                  ),),
              top: MediaQuery.of(context).size.height / 2 - 50,
              left: MediaQuery.of(context).size.width / 2 - 50,
            ),
            Positioned(
              child: Opacity(
                  opacity: 0.5,
                  child: FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: 80,
                  ),),
              bottom: 10,
              left: 10,
            ),
          ]
          // end if
        ]
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: refreshStack),
    );
  }
}

 */

/* Using a while loop


  @override
  Widget build(BuildContext context) {
    final characters = '''故人西辞黄鹤楼，烟花三月下扬州。
    孤帆远影碧空尽，唯见长江天际流。'''
        .split('');
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


 */
