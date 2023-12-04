import 'package:flutter/material.dart';
import 'package:tracking_and_tasking/constrains/colors.dart';
import 'package:tracking_and_tasking/models/todomodel.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final ontodochange;
  final ondelete;
  const TodoItem(
      {super.key, required this.todo, this.ontodochange, this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          ontodochange(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        tileColor: Colors.white,
        leading: todo.isDone
            ? Icon(
                Icons.check_box,
                color: tdvoilet,
              )
            : Icon(Icons.check_box_outline_blank),
        title: Text(
          todo.todotext!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 30,
          width: 30,
          child: IconButton(
            icon: Icon(Icons.delete, color: tdBlack),
            onPressed: () {
              ondelete(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
