import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final _httpLink = HttpLink(
  'http://127.0.0.1:8080/v1/graphql',
  defaultHeaders: {
    "x-hasura-admin-secret": "admin",
  },
);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(),
    link: _httpLink,
  ),
);
