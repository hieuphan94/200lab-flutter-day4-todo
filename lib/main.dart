import 'package:flutter/material.dart';
import 'package:todo/custom_animation.dart';
import 'package:todo/detai_page.dart';
import 'package:todo/detai_page_argument.dart';
import 'package:todo/edit_page.dart';
import 'package:todo/routes/route_name.dart';
import 'package:todo/routes/router.dart' as router;
import 'package:todo/todo.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FT01',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomePage(),
//         '/animation': (context) => CustomAnimation(),
//         '/detaiPageArgument': (context) => DetailPageArgument(),
//         '/editPage': (context) {
//           Todo todo = ModalRoute.of(context)?.settings.arguments as Todo;
//           return EditPage(todo: todo);
//         }
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FT01',
        initialRoute: RouteName.homePage,
        onGenerateRoute: router.Router.onGenerateRoute);
  }
}
