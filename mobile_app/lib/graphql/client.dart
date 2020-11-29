import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/auth.dart';
import 'package:provider/provider.dart';

class GraphQL extends StatelessWidget {
  final Widget child;

  const GraphQL({@required this.child});

  @override
  Widget build(BuildContext context) {
    final httpLink = HttpLink('http://127.0.0.1:8080/v1/graphql');

    final cache = GraphQLCache();

    return Consumer<Auth>(builder: (context, auth, _) {
      final authLink = AuthLink(getToken: () => auth.accessToken());
      final link = authLink.concat(httpLink);

      final client = GraphQLClient(
        cache: cache,
        link: link,
      );
      return GraphQLProvider(
        client: ValueNotifier(client),
        child: this.child,
      );
    });
  }
}
