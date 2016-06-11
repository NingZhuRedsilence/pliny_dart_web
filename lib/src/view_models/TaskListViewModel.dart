part of view_models;

/**
 * Created by Ning on 6/06/2016.
 */
class TaskListViewModel {
  final List<String> _taskDescriptions = [];
  Iterable<String> get tasks => _taskDescriptions;

  final StreamController<String> _onTaskAddedController =
      new StreamController.broadcast();
  Stream<String> get onTaskAdded => _onTaskAddedController.stream;

  TaskListViewModel(Iterable<String> taskDescriptions) {
    for (String task in taskDescriptions) {
      _taskDescriptions.add(task);
    }
  }

  bool addTask(String task) {
    _onTaskAddedController.add(task);
      _taskDescriptions.add(task);
      return true;

  }
}
