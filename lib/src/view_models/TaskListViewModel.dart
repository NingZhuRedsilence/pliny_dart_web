part of view_models;

/**
 * Created by Ning on 6/06/2016.
 */
class TaskListViewModel {
  final List<String> _taskDescriptions = [];
  final StreamController<String> _onAddTaskToVMController =
      new StreamController.broadcast();

  TaskListViewModel(Iterable<String> taskDescriptions) {
    for (String task in taskDescriptions) {
      _taskDescriptions.add(task);
    }
  }

  Stream<String> get onTaskAdded => _onAddTaskToVMController.stream;

  Iterable<String> get tasks => _taskDescriptions;

  bool addTask(String task) {
    if (_taskDescriptions.indexOf(task) >= 0) {
      return false;
    } else {
      _onAddTaskToVMController.add(task);
      _taskDescriptions.add(task);
      return true;
    }
  }
}
