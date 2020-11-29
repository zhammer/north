import 'package:flutter/cupertino.dart';
import 'package:north/graphql/generated.graphql.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Post extends StatefulWidget {
  // todo: see if we can use a shared 'post' data fragment: https://github.com/comigor/artemis/issues/137#issuecomment-630383853
  final HomePage$QueryRoot$Posts post;

  const Post({@required this.post});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int _haikuIndex = 0;

  void _onCarouselPageChanged(index, _) {
    setState(() => _haikuIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          // https://pub.dev/packages/carousel_slider for insta type thing?
          // https://medium.com/@nickwu241/creating-an-instagram-clone-with-flutter-4e81eab2ed69
          Container(
            decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid),
            ),
            child: CarouselSlider(
              items: widget.post.haikus
                  .map((haiku) => Haiku(haiku: haiku))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: _onCarouselPageChanged,
                height: 150,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.post.haikus.length > 1)
                CarouselIndicator(
                  count: widget.post.haikus.length,
                  index: _haikuIndex,
                )
            ],
          ),
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
      child: Center(
        child: Text(
          '${haiku.line1}\n${haiku.line2}\n${haiku.line3}',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.25,
          ),
        ),
      ),
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  final int count;
  final int index;

  CarouselIndicator({
    @required this.count,
    @required this.index,
  });

  Widget _buildDot(BuildContext context, {bool isActive}) {
    final theme = CupertinoTheme.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: isActive ? 7.5 : 6.0,
          width: isActive ? 7.5 : 6.0,
          decoration: BoxDecoration(
            color: isActive ? theme.primaryColor : CupertinoColors.inactiveGray,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (i) => i)
          .map((i) => _buildDot(context, isActive: i == index))
          .toList(),
    );
  }
}
