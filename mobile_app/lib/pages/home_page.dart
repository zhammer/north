import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/colors.dart';
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
            child: ListView.separated(
              itemBuilder: (context, i) {
                final post = data.posts[i];
                return Post(post: post);
              },
              separatorBuilder: (context, i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    3,
                    (i) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: SvgPicture.asset(
                        'assets/wave.svg',
                        height: 40,
                        color: leaf2,
                      ),
                    ),
                  ),
                );
              },
              itemCount: (data.posts.length),
            ),
          );
        },
      ),
    );
  }
}
