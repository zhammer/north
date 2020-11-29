import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:north/auth.dart';
import 'package:north/graphql/client.dart';
import 'package:north/pages/authed_pages.dart';
import 'package:north/pages/landing_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

const leaf0 = Color.fromRGBO(200, 47, 49, 1);
const leaf1 = Color.fromRGBO(218, 63, 27, 1);
const leaf2 = Color.fromRGBO(255, 149, 57, 1);
const leaf3 = Color.fromRGBO(252, 210, 3, 1);

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return ChangeNotifierProvider(
      create: (_) => Auth(),
      child: GraphQL(
        child: CupertinoApp(
          title: 'north',
          theme: CupertinoThemeData().copyWith(
            primaryColor: leaf0,
            textTheme: CupertinoTextThemeData().copyWith(
              navTitleTextStyle:
                  CupertinoTextThemeData().navTitleTextStyle.copyWith(
                        color: leaf0,
                        fontWeight: FontWeight.w200,
                      ),
            ),
          ),
          home: Consumer<Auth>(builder: (context, auth, _) {
            if (!auth.loggedIn()) {
              return LandingPage();
            }
            return AuthedPages();
          }),
        ),
      ),
    );
  }
}
