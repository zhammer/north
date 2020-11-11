import 'package:flutter/cupertino.dart';
import 'package:north/graphql/client.dart';
import 'package:north/pages/landing_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

const _leaf0 = Color.fromRGBO(200, 47, 49, 1);

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GraphQLClientNotifier(client: client),
      child: CupertinoApp(
        title: 'north',
        theme: CupertinoThemeData().copyWith(
          primaryColor: _leaf0,
        ),
        home: LandingPage(title: 'north'),
      ),
    );
  }
}
