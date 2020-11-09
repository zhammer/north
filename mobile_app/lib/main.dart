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

  void _handleSignupClicked(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return SignUpPage();
    }));
  }

  void _handleLoginClicked(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return LogInPage();
    }));
  }

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
              onPressed: () => {_handleLoginClicked(context)},
            ),
            CupertinoButton.filled(
              child: Text('sign up'),
              onPressed: () => _handleSignupClicked(context),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  void _handleSubmitted(
      BuildContext context, String username, String password) {}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'sign up',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            UserPassForm(onSubmitted: _handleSubmitted),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

class LogInPage extends StatelessWidget {
  void _handleSubmitted(
      BuildContext context, String username, String password) {}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'log in',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            UserPassForm(onSubmitted: _handleSubmitted),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

class UserPassForm extends StatefulWidget {
  final void Function(BuildContext context, String username, String password)
      onSubmitted;

  UserPassForm({@required this.onSubmitted});

  @override
  UserPassFormState createState() {
    return UserPassFormState();
  }
}

class UserPassFormState extends State<UserPassForm> {
  TextEditingController _usernameController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoTextField(
          controller: _usernameController,
          prefix: Icon(
            CupertinoIcons.person_solid,
            color: CupertinoColors.lightBackgroundGray,
            size: 28,
          ),
          autocorrect: false,
          placeholder: 'username',
        ),
        CupertinoTextField(
          controller: _passwordController,
          prefix: Icon(
            CupertinoIcons.lock_fill,
            color: CupertinoColors.lightBackgroundGray,
            size: 28,
          ),
          autocorrect: false,
          placeholder: 'password',
          obscureText: true,
        ),
        CupertinoButton(
          child: Text('submit'),
          onPressed: () {
            this.widget.onSubmitted(
                  context,
                  _usernameController.text,
                  _passwordController.text,
                );
          },
        )
      ],
    );
  }
}
