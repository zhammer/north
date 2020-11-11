import 'package:flutter/cupertino.dart';
import 'package:north/pages/create_account_page.dart';
import 'package:north/pages/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);

  void _handleCreateAccountClicked(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return CreateAccountPage();
    }));
  }

  void _handleLogInClicked(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return SignInPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: [
                  Text(
                    'north 北',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle,
                  ),
                  Text('a haiku app',
                      style: CupertinoTheme.of(context).textTheme.textStyle)
                ],
              ),
            ),
            CupertinoButton.filled(
              child: Text('create account'),
              onPressed: () => {_handleCreateAccountClicked(context)},
            ),
            CupertinoButton(
              child: Text('sign in'),
              onPressed: () => _handleLogInClicked(context),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
