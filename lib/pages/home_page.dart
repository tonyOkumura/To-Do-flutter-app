// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_title.dart';
import 'package:todo_app/data/todoDatasource.dart';
import 'package:todo_app/models/todoModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoDataSource = TodoDataSource();
  // final List<ToDoModel> _allToDos = [];
  final TextEditingController _toDoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _buildFloatingActionButton(),
        appBar: _buildAppBar(),
        body: _buildBody());
  }

  Column _buildBody() {
    return Column(
      children: [
        _todosStatistic(),
        _todosList(),
      ],
    );
  }

  Expanded _todosList() {
    return Expanded(
      flex: 9,
      child: ListView.builder(
        itemCount: _todoDataSource.getAllToDos().length,
        itemBuilder: (context, index) {
          return ToDoTitle(
            todo: _todoDataSource.getAllToDos()[
                _todoDataSource.getAllToDos().length - index - 1],
            onDoubleTap: () => _removeToDoAtIndex(
                _todoDataSource.getAllToDos().length - index - 1),
          );
        },
      ),
    );
  }

  void _removeToDoAtIndex(int index) {
    setState(() {
      _todoDataSource.getAllToDos().removeAt(index);
    });
  }

  Expanded _todosStatistic() {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("All To-Dos",
                style: TextStyle(
                    fontSize: 30, decoration: TextDecoration.underline)),
            Text(
              "total number ${_todoDataSource.getAllToDos().length}",
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Center(child: const Text('ToDo App')),
      backgroundColor: Colors.black,
      elevation: 0,
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.green[500],
      child: const Icon(Icons.add),
      elevation: 0,
      onPressed: () {
        _showAddToDoDialog();
      },
    );
  }

  void _showAddToDoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add To-Do'),
          content: TextField(
            style: TextStyle(color: Colors.black),
            controller: _toDoTextController,
            autofocus: true,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              labelText: 'To-Do',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                _toDoTextController.clear();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                _addToDoItem(_toDoTextController.text);
                _toDoTextController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _addToDoItem(String newText) {
    setState(() {
      _todoDataSource
          .getAllToDos()
          .add(ToDoModel(text: newText, isDone: false));
    });
  }
}
