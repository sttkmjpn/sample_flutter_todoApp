import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/main/main_model.dart';

class AddPage extends StatelessWidget {
  final MainModel model;
  AddPage(this.model);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>.value(
      value: model,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add New ToDo thing'),
        ),
        body: Consumer<MainModel>(
          builder: (context, model, child) {
            final todoList = model.todoList;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Add your ToDo thing",
                        hintText: "Call your family"),
                    onChanged: (text) {
                      model.newTodoText = text;
                    },
                  ),
                  SizedBox(height: 16.0),
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: () async {
                      await model.add();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
