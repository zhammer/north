import 'package:flutter/cupertino.dart';
import 'package:north/graphql/generated.graphql.dart';

class Post extends StatelessWidget {
  // todo: see if we can use a shared 'post' data fragment: https://github.com/comigor/artemis/issues/137#issuecomment-630383853
  final HomePage$QueryRoot$Posts post;

  const Post({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [Text(post.createdBy.username)],
          ),
          // https://pub.dev/packages/carousel_slider for insta type thing?
          // https://medium.com/@nickwu241/creating-an-instagram-clone-with-flutter-4e81eab2ed69
          Container(
            height: 110,
            child: Text(
              '${post.haikus[0].line1}\n${post.haikus[0].line2}\n${post.haikus[0].line3}\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
