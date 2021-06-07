import 'package:flutter/material.dart';
import 'package:todo/detai_page_argument.dart';
import 'package:todo/edit_page.dart';
import 'package:todo/custom_animation.dart';
import 'package:todo/home_page.dart';
import 'package:todo/routes/route_name.dart';
import 'package:todo/todo.dart';

class Router {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.editPage:
        {
          Todo todo = settings.arguments as Todo;
          return MaterialPageRoute(builder: (_) => EditPage(todo: todo));
        }
      case RouteName.homePage:
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case RouteName.editPageWithAnimation:
        {
          return MaterialPageRoute(builder: (_) => CustomAnimation());
        }
      default:
        {
          return MaterialPageRoute(
              builder: (context) => Scaffold(
                    body: Center(
                      child: Text("No routes match"),
                    ),
                  ));
        }
    }
  }
}
