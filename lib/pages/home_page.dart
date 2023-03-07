// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_title.dart';
import 'package:todo_app/models/todoModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _toDoTextController = TextEditingController();
  final List<ToDoModel> _allToDos = [
    ToDoModel(text: 'Buy milk', isDone: false),
    ToDoModel(text: 'Buy bread', isDone: false),
    ToDoModel(text: 'Buy eggs', isDone: false),
    ToDoModel(text: 'Wash the car', isDone: false),
    ToDoModel(text: 'Walk the dog', isDone: false),
    ToDoModel(text: 'Water the plants', isDone: false),
    ToDoModel(text: 'Pay the bills', isDone: false),
    ToDoModel(text: 'Take out the trash', isDone: false),
    ToDoModel(text: 'Vacuum the house', isDone: false),
    ToDoModel(text: 'Do the laundry', isDone: false),
    ToDoModel(text: 'Clean the bathroom', isDone: false),
    ToDoModel(text: 'Sweep the floors', isDone: false),
    ToDoModel(text: 'Organize the closet', isDone: false),
    ToDoModel(text: 'Call mom', isDone: false),
    ToDoModel(text: 'Exercise', isDone: false),
    ToDoModel(text: 'Read a book', isDone: false),
    ToDoModel(text: 'Write a blog post', isDone: false),
    ToDoModel(text: 'Plan a vacation', isDone: false),
    ToDoModel(text: 'Learn a new skill', isDone: false),
    ToDoModel(text: 'Cook a new recipe', isDone: false),
    ToDoModel(text: 'Go for a run', isDone: false),
    ToDoModel(text: 'Take a nap', isDone: false),
    ToDoModel(text: 'Watch a movie', isDone: false),
    ToDoModel(text: 'Listen to music', isDone: false),
    ToDoModel(text: 'Write a letter', isDone: false),
    ToDoModel(text: 'Practice a musical instrument', isDone: false),
    ToDoModel(text: 'Do a puzzle', isDone: false),
    ToDoModel(text: 'Play a board game', isDone: false),
    ToDoModel(text: 'Organize photos', isDone: false),
    ToDoModel(text: 'Go for a bike ride', isDone: false),
    ToDoModel(text: 'Take a yoga class', isDone: false),
    ToDoModel(text: 'Paint a picture', isDone: false),
    ToDoModel(text: 'Plant a garden', isDone: false),
    ToDoModel(text: 'Write a poem', isDone: false),
    ToDoModel(text: 'Learn a new language', isDone: false),
    ToDoModel(text: 'Go on a hike', isDone: false),
    ToDoModel(text: 'Make a homemade gift', isDone: false),
    ToDoModel(text: 'Practice meditation', isDone: false),
    ToDoModel(text: 'Try a new restaurant', isDone: false),
    ToDoModel(text: 'Go camping', isDone: false),
    ToDoModel(text: 'Attend a concert', isDone: false),
    ToDoModel(text: 'Visit a museum', isDone: false),
  ];

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
        itemCount: _allToDos.length,
        itemBuilder: (context, index) {
          return ToDoTitle(
            todo: _allToDos[_allToDos.length - index - 1],
            onDoubleTap: () => _removeToDoAtIndex(_allToDos.length - index - 1),
          );
        },
      ),
    );
  }

  void _removeToDoAtIndex(int index) {
    setState(() {
      _allToDos.removeAt(index);
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
              "total number ${_allToDos.length}",
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
      _allToDos.add(ToDoModel(text: newText, isDone: false));
    });
  }
}
