import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/auth.dart';

final _httpLink = HttpLink(
  'http://127.0.0.1:8080/v1/graphql',
  defaultHeaders: {
    "x-hasura-admin-secret": "admin",
  },
);

final _authLink = AuthLink(getToken: () async => await getTokenFromStorage());

final _link = _authLink.concat(_httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  ),
);
