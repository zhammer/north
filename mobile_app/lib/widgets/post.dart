import 'package:flutter/cupertino.dart';
import 'package:north/graphql/generated.graphql.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          CarouselSlider(
              items: post.haikus.map((haiku) => Haiku(haiku: haiku)).toList(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
              ))
        ],
      ),
    );
  }
}

class Haiku extends StatelessWidget {
  final HomePage$QueryRoot$Posts$Haikus haiku;

  const Haiku({Key key, @required this.haiku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Text(
        '${haiku.line1}\n${haiku.line2}\n${haiku.line3}\n',
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 2,
        ),
      ),
    );
  }
}
