import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class EditPage extends StatefulWidget {
  final Todo? todo;

  EditPage({this.todo});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  Todo? todo;

  @override
  void initState() {
    todo = widget.todo;
    nameController.text = todo?.title ?? "";
    desController.text = todo?.description ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo?.title ?? ""),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Nhập vào tên Todo',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey, width: 1))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: desController,
                decoration: InputDecoration(
                    labelText: 'Nhập vào mô tả',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey, width: 1))),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Todo newTodo = Todo(
                    id: todo!.id!,
                    title: nameController.text,
                    description: desController.text);

                Navigator.pop(context, newTodo);
              },
              child: Text('Cập nhật'),
              style: btnStyle,
            ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle btnStyle =
    ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.pink));
