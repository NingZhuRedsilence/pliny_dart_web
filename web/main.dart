import 'package:plinyWed/src/controller.dart';
import 'package:plinyWed/src/models.dart';

void main() {
  TaskRepository repos = new TaskRepositoryInMemory();

  new TodoAppController(repos).start();
}
