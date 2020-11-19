import 'package:flutter/cupertino.dart';
import 'package:north/graphql/generated.graphql.dart';
import 'package:north/widgets/post.dart';

class HomePage extends StatelessWidget {
  final AuthedPages$QueryRoot data;

  HomePage({@required this.data});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('north 北'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: data.feed.map((post) {
            return Post(post: post);
          }).toList(),
        ),
      ),
    );
  }
}
