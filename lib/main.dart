import 'package:flutter/material.dart';
import 'stack_characters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              makeDemoEntry(context, "Stack of Characters", StackCharacters()),
            ],
          ),
        ),
      ),
    );
  }

    Widget makeDemoEntry(BuildContext context, String title, Widget nextScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 50.0,
        ),
        Icon(Icons.star),
        FlatButton(
          child: Text(title),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextScreen),
            );
          },
        ),
      ],
    );
  }
}
