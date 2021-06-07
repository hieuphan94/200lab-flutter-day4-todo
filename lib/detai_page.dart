import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class DetailPage extends StatelessWidget {
  final Todo todo;

  DetailPage(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title ?? ""),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(todo.description ?? "")),
      ),
    );
  }
}
