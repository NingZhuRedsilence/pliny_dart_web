import 'dart:html';
import 'package:plinyWed/src/models.dart';
import 'package:plinyWed/src/controller.dart';
import 'package:plinyWed/src/view_models.dart';

void main() {
  print("i am a llama");
  TaskRepository repos = new TaskRepositoryInMemory();
  new ToDoAppController(repos).start();
  //Task _task = new Task("hello", true);
  //  toDoInput = querySelector('#to-do-input');
  DivElement div = querySelector('#output');
  div.innerHtml = 'Task is ' ;//+ _task.description;
  print(div);

  //print(_task.description);
}

