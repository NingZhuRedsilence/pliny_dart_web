part of view_models;

/**
 * Created by Ning on 6/06/2016.
 */
class TaskListViewModel {
  final List<String> _tasksDesc = [];

  final StreamController<String> _onAddTaskInModelController =
      new StreamController.broadcast();
  TaskListViewModel(Iterable<String> tasks) {
    for (String task in tasks) {
      _tasksDesc.add(task);
    }
  }

  Stream<String> get onTaskAdded => _onAddTaskInModelController.stream;

  Iterable<String> get tasks => _tasksDesc;

  bool addTask(String task) {
    if (_tasksDesc.indexOf(task) >= 0) {
      return false;
    } else {
      _onAddTaskInModelController.add(task);
      _tasksDesc.add(task);
      print("testing viewModel's to addBtn click");
      return true;
    }
  }
}
