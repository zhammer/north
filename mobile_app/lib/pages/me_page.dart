import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/graphql/generated.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('north 北'),
      ),
      child: Query(
        options: QueryOptions(document: MePageQuery().document),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.isLoading) {
            return Center(child: Text('loading...'));
          }
          final data = MePage$QueryRoot.fromJson(result.data);
          return Center(
            child: Text(data.toJson().toString()),
          );
        },
      ),
    );
  }
}
