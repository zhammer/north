import 'package:flutter/cupertino.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'north',
      theme: CupertinoThemeData(),
      home: HomePage(title: 'north'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            Text(
              'north',
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            ),
            Text('a haiku app'),
            CupertinoButton(
              child: Text('log in'),
              onPressed: () => {},
            ),
            CupertinoButton.filled(
              child: Text('sign up'),
              onPressed: () => {},
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
