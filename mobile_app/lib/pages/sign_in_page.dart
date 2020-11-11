import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/auth.dart';
import 'package:north/graphql/generated.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _usernameController = TextEditingController(text: '');
  TextEditingController _passwordController = TextEditingController(text: '');

  void _handleSubmitted(BuildContext context) async {
    final client = GraphQLProvider.of(context).value;
    final auth = Provider.of<Auth>(context, listen: false);
    final mutation = SignInMutation(
      variables: SignInArguments(
        password: _passwordController.text,
        username: _usernameController.text,
      ),
    );
    final result = await client.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.getVariablesMap(),
      ),
    );

    if (result.hasException) {
      debugPrint(result.exception.toString());
      return;
    }

    final data = SignIn$MutationRoot.fromJson(result.data);
    await auth.setToken(data.signIn.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('sign in'),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: AutofillGroup(
            child: Column(
              children: <Widget>[
                CupertinoTextField(
                  controller: _usernameController,
                  autocorrect: false,
                  placeholder: 'username',
                  autofillHints: [AutofillHints.username],
                ),
                CupertinoTextField(
                  controller: _passwordController,
                  autocorrect: false,
                  placeholder: 'password',
                  obscureText: true,
                  autofillHints: [AutofillHints.password],
                ),
                SizedBox(height: 20),
                CupertinoButton.filled(
                  child: Text('sign in'),
                  onPressed: () => _handleSubmitted(context),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
      ),
    );
  }
}
