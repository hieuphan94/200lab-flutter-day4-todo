import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:todo/detai_page.dart';
import 'package:todo/edit_page.dart';
import 'package:todo/custom_animation.dart';
import 'package:todo/routes/route_name.dart';
import 'package:todo/todo.dart';
import 'package:todo/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = List.generate(
      20,
      (index) => Todo(
          id: index, title: 'Todo $index', description: 'Description $index'));

  bool pushNormal = true;
  bool pushRoute = false;
  bool pushReturn = false;
  bool pushByAnimation = false;
  bool pushByCustomRoute = false;

  setPushType(
      {bool? normal,
      bool? route,
      bool? pushReturn,
      bool? animtaion,
      bool? custom}) {
    setState(() {
      this.pushNormal = normal ?? false;
      this.pushRoute = route ?? false;
      this.pushReturn = pushReturn ?? false;
      this.pushByAnimation = animtaion ?? false;
      this.pushByCustomRoute = custom ?? false;
    });
  }

  Widget buildRow(Todo e) {
    return Container(
      color: randomColor(),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: InkWell(
          onTap: () async {
            pushCustomRoute(context, e);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(e.title ?? ''),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(e.description ?? ""),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: todos.map((e) => buildRow(e)).toList(),
      ),
    );
  }

  void pushCustomRoute(BuildContext context, Todo e) {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => DetailPage(e),
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            }));
  }

  void push(BuildContext context, Todo todo) async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (_) => DetailPage(todo)));

    // Todo? newTodo = await Navigator.push(
    //     context, MaterialPageRoute(builder: (_) => EditPage(todo: todo)));
    // if (newTodo != null) {
    //   setState(() {
    //     todos[newTodo.id!] = newTodo;
    //   });
    // }
    // Navigator.pushNamed(context, RouteName.editPageWithAnimation,
    //     arguments: todo);

    // pushCustomRoute(context, todo);

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (_) => CustomAnimation()));
  }

  //   if (pushNormal) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (_) => DetailPage(todo)));
  //   } else if (pushReturn) {
  //     Todo? newTodo = await Navigator.push(
  //         context, MaterialPageRoute(builder: (_) => EditPage(todo: todo)));
  //     if (newTodo != null) {
  //       setState(() {
  //         todos[newTodo.id!] = newTodo;
  //       });
  //     }
  //   } else if (pushRoute) {
  //     Navigator.pushNamed(context, RouteName.editPageWithAnimation,
  //         arguments: todo);
  //   } else if (pushByCustomRoute) {
  //     pushCustomRoute(context, todo);
  //   } else {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (_) => CustomAnimation()));
  //   }
  // }
}
