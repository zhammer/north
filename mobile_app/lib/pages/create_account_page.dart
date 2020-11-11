import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/graphql/generated.graphql.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _usernameController = TextEditingController(text: '');
  TextEditingController _passwordController = TextEditingController(text: '');
  TextEditingController _confirmPasswordController =
      TextEditingController(text: '');

  void _handleSubmitted(BuildContext context) async {
    final client = GraphQLProvider.of(context).value;
    final mutation = CreateAccountMutation(
      variables: CreateAccountArguments(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
    final result = await client.mutate(MutationOptions(
      document: mutation.document,
      variables: mutation.getVariablesMap(),
    ));

    if (result.hasException) {
      debugPrint(result.exception.toString());
      return;
    }

    final data = CreateAccount$MutationRoot.fromJson(result.data);
    debugPrint(data.createAccount.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('create account'),
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
                  autofillHints: [AutofillHints.newUsername],
                ),
                CupertinoTextField(
                  controller: _passwordController,
                  autocorrect: false,
                  placeholder: 'password',
                  obscureText: true,
                  autofillHints: [AutofillHints.newPassword],
                ),
                CupertinoTextField(
                  controller: _confirmPasswordController,
                  autocorrect: false,
                  placeholder: 'confirm password',
                  obscureText: true,
                  autofillHints: [AutofillHints.newPassword],
                ),
                SizedBox(height: 20),
                CupertinoButton.filled(
                  child: Text('create account'),
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
