import 'package:flutter/cupertino.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _usernameController = TextEditingController(text: '');
  TextEditingController _passwordController = TextEditingController(text: '');

  void _handleSubmitted() {}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('log in'),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              CupertinoTextField(
                controller: _usernameController,
                autocorrect: false,
                placeholder: 'username',
              ),
              CupertinoTextField(
                controller: _passwordController,
                autocorrect: false,
                placeholder: 'password',
                obscureText: true,
              ),
              SizedBox(height: 20),
              CupertinoButton.filled(
                child: Text('sign in'),
                onPressed: _handleSubmitted,
              )
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }
}
