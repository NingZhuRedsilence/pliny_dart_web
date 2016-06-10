/**
 * Created by Ning on 6/6/2016.
 */
part of models;

class TaskRepositoryInMemory extends TaskRepository {
  final List<Task> _tasks = [];

  TaskRepositoryInMemory() {
    _tasks
      ..add(new Task("Feed cat.", false))
      ..add(new Task("Feed dog.", false))
      ..add(new Task("Take out trash.", true));
  }

  @override
  Iterable<Task> get tasks => _tasks;

  bool addTask(Task newTask) {
    _tasks.add(newTask);
    return true;
  }
}
