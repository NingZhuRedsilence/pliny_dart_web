import 'dart:html';
<<<<<<< HEAD
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

=======
import '../lib/src/models.dart';

void main(List<String> arguments) {
  //Task _task = new Task("hello", true);
  querySelector('#output').text = 'Task is ' ;//+ _task.description;
>>>>>>> 51832a0e9a4f99eb98c207d69dd0f854f4e7838c
  //print(_task.description);
}

