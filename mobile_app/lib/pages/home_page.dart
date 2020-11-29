import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/graphql/generated.graphql.dart';
import 'package:north/widgets/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('north 北'),
      ),
      child: Query(
        options: QueryOptions(document: HomePageQuery().document),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.isLoading) {
            return Center(child: Text('loading...'));
          }
          final data = HomePage$QueryRoot.fromJson(result.data);
          return SafeArea(
            child: Column(
              children: data.posts.map((post) => Post(post: post)).toList(),
            ),
          );
        },
      ),
    );
  }
}
