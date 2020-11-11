import 'package:flutter/cupertino.dart';
import 'package:north/pages/home_page.dart';
import 'package:north/pages/me_page.dart';

class AuthedPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person))
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            switch (i) {
              case 0:
                return HomePage();
              case 1:
                return MePage();
              default:
                return Text('oops!');
            }
          },
        );
      },
    );
  }
}

// CupertinoTabScaffold(
//       navigationBar: CupertinoNavigationBar(),
//       child: Center(
//         child: Query(
//           options: QueryOptions(
//             document: HomePageQuery().document,
//           ),
//           builder: (QueryResult result,
//               {VoidCallback refetch, FetchMore fetchMore}) {
//             if (result.hasException) {
//               return Text(result.exception.toString());
//             }
//
//             final data = HomePage$QueryRoot.fromJson(result.data);
//             return Text(data.toJson().toString());
//           },
//         ),
//       ),
//     );
