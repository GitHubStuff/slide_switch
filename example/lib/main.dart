import 'package:flutter/material.dart';
import 'package:slide_switch/slide_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Switch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Slide Switch Demo'),
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
  final textStyle = TextStyle(
    fontSize: 24.0,
  );
  Widget _scaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${DateTime.now().toLocal()}', style: textStyle),
            Text('Have you pushed the button?', style: textStyle),
            Text(
              '😈',
              style: Theme.of(context).textTheme.headline4,
            ),
            SlideSwitchWidget(
                tag: 'First',
                callback: (tag, state) => debugPrint('TAG:$tag STATE:$state'),
                trueCaption: Text('Mute?', style: textStyle),
                trueIcon: Text('👂🏻', style: textStyle)),
            SlideSwitchWidget(
              tag: 'Second',
              callback: (tag, state) => debugPrint('TAG:$tag STATE:$state'),
              trueCaption: Text('Fun?', style: textStyle),
              falseCaption: Text('No Fun?', style: textStyle),
              falseIcon: Text('🤮', style: textStyle),
            ),
            Text('${DateTime.now().toLocal()}', style: textStyle),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Push',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }
}
