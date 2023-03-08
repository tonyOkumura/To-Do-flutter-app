// ignore_for_file: file_names

import '../models/todoModel.dart';

class TodoDataSource {
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

  List<ToDoModel> getAllToDos() {
    return _allToDos;
  }

  void addNewTodoItem(String text) {
    _allToDos.add(ToDoModel(text: text, isDone: false));
  }

  void removeTodoItem(int index) {
    _allToDos.removeAt(index);
  }
}
