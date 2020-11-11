import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

final _httpLink = HttpLink(
  'http://127.0.0.1:8080/v1/graphql',
  defaultHeaders: {
    "x-hasura-admin-secret": "admin",
  },
);

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: _httpLink,
);

class GraphQLClientNotifier with ChangeNotifier {
  final GraphQLClient client;
  GraphQLClientNotifier({@required this.client});
}
