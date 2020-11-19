import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:north/auth.dart';
import 'package:north/pages/home_page.dart';
import 'package:north/pages/me_page.dart';
import 'package:north/graphql/generated.dart';
import 'package:provider/provider.dart';

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
            return Query(
              options: QueryOptions(document: AuthedPagesQuery().document),
              builder: (QueryResult result,
                  {VoidCallback refetch, FetchMore fetchMore}) {
                return Consumer<Auth>(builder: (context, auth, _) {
                  if (result.isLoading) {
                    return Text('loading');
                  }
                  if (result.hasException) {
                    if (result.exception.graphqlErrors[0].extensions["code"] ==
                        "access-denied") {
                      auth.clear();
                    }
                    return Text(result.exception.toString());
                  }
                  final data = AuthedPages$QueryRoot.fromJson(result.data);
                  if (data.me.length != 1) {
                    auth.clear();
                    return Text('redirecting to landing page');
                  }

                  switch (i) {
                    case 0:
                      return HomePage(data: data);
                    case 1:
                      return MePage(data: data);
                    default:
                      return Text('oops!');
                  }
                });
              },
            );
          },
        );
      },
    );
  }
}
