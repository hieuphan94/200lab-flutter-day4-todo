import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class DetailPageArgument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Todo todo = ModalRoute.of(context)?.settings.arguments as Todo;

    return Scaffold(
        appBar: AppBar(
          title: Text(todo.title ?? ""),
        ),
        body: Center(
          child: Text(todo.description ?? ""),
        ));
  }
}
