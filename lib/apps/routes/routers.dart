import 'package:app_trac_nghiem/Screens/article/article_page.dart';
import 'package:app_trac_nghiem/Screens/category/category_page.dart';
import 'package:app_trac_nghiem/Screens/home/widget/home_page.dart';
import 'package:app_trac_nghiem/apps/routes/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class RouterConfigCustom {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutersPath.homePath,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: RoutersName.categoryName,
            path: RoutersPath.categoryPath,
            builder: (BuildContext context, GoRouterState state) {
              return const CategoryPage();
            },
            routes: <RouteBase>[
              GoRoute(
                name: RoutersName.articleName,
                path: RoutersName.articleName,
                builder: (BuildContext context, GoRouterState state) {
                   Map data = state.extra as Map;

                  int id = data['id'];
                  String name = data['name'];
                 
                  return ArticlePage(
                    idTopic: id,
                    name: name,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
