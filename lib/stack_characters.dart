import 'dart:math';

import 'package:flutter/material.dart';

class StackCharacters extends StatefulWidget {
  @override
  _StackCharactersState createState() {
    return new _StackCharactersState();
  }
}

class _StackCharactersState extends State<StackCharacters> {

  void refreshStack(){
    setState(() {
          
        });
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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.refresh),onPressed: refreshStack),
    );
  }

  List<Widget> generateStackContent() {
    final characters = '''作为中文的书写文字，汉字是迄今为止连续使用时间最长的主要文字，
    也是上古时期各大文字体系中唯一传承至今的，相较而言，古埃及、古巴比伦、古印度文字都早已消亡，
    所以有学者认为汉字是维系中国南北长期处于统一状态的关键元素之一，亦有学者将汉字列为中国第五大发明。'''.split('');
    final random = Random();
    final topMax = 600.0;
    final leftMax = 400.0;
    List<Widget> stackContent = [
      Container(color: Colors.amber.shade100),
    ]; 
    for (var char in characters) {
      var top = random.nextDouble() * topMax ;
      var left = random.nextDouble() * leftMax;
      stackContent.add(Positioned(child: Text(char, style: TextStyle(fontSize: 32),), top:top, left:left));
    }
    return stackContent;
  }
}