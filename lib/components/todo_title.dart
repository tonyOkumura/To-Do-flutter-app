// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create

import 'package:flutter/material.dart';
import 'package:todo_app/models/todoModel.dart';

class ToDoTitle extends StatefulWidget {
  final ToDoModel todo;
  final Function()? onDoubleTap;

  ToDoTitle({
    super.key,
    required this.todo,
    required this.onDoubleTap,
  });

  @override
  State<ToDoTitle> createState() => _ToDoTitleState();
}

class _ToDoTitleState extends State<ToDoTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: GestureDetector(
        onDoubleTap: widget.onDoubleTap,
        onTap: () {
          _changeIsDone();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              color: Colors.grey[900],
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  Icon(
                      widget.todo.isDone
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: widget.todo.isDone ? Colors.green : Colors.white),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      widget.todo.text,
                      style: TextStyle(
                        fontSize: 20,
                        color: widget.todo.isDone ? Colors.green : Colors.white,
                        decoration: widget.todo.isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  )
                ]),
              )),
        ),
      ),
    );
  }

  void _changeIsDone() {
    return setState(() {
      widget.todo.isDone = !widget.todo.isDone;
    });
  }
}
