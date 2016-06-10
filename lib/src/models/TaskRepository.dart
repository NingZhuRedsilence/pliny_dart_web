part of models;

abstract class TaskRepository {
  Iterable<Task> get tasks;

  bool addTask(Task newTask);
}
