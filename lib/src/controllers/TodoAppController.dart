part of controller;

/**
 * Created by Ning on 06/08/2016.
 */
class TodoAppController {
  final AddTaskView _addTaskView = new AddTaskView();
  final TaskRepository _iTaskRepos;
  final ToolbarView _toolbarView = new ToolbarView();

  ListTasksView _listTasksView;
  TotalTasksView _totalTasksView;
  TaskListViewModel _vm;

  TodoAppController(this._iTaskRepos) {
    /**
     * Translate model to view model.
     */
    _vm = _toVM(_iTaskRepos);
    _listTasksView = new ListTasksView(_vm);
    _totalTasksView = new TotalTasksView(_vm);
    _totalTasksView.hide();

    _addTaskView.onAddTaskRequested.listen(_handleAddTaskRequested);
    _toolbarView.onShowListRequested.listen((e) {
      _handleShowListRequested();
    });
    _toolbarView.onShowTotalRequested.listen((e) {
      _handleShowTotalRequested();
    });
  }

  void start() {
    _listTasksView.show();
  }

  void _addTask(String taskDescription) {
    if (_vm.tasks.any((taskDesc) => taskDesc == taskDescription)) {
      return false;
    } else {
      _iTaskRepos.addTask(new Task(taskDescription, false));
      _vm.addTask(taskDescription);
      return true;
    }

  }

  void _handleAddTaskRequested(String message) {
    _addTask(message);
  }

  void _handleShowListRequested() {
    _listTasksView.show();
    _totalTasksView.hide();
  }

  void _handleShowTotalRequested() {
    _listTasksView.hide();
    _totalTasksView.show();
  }

  TaskListViewModel _toVM(TaskRepository repos) {
    List<String> taskDescriptions = [];

    for (Task task in repos.tasks) {
      if (!task.isCompleted) {
        taskDescriptions.add(task.description);
      }
    }
    return new TaskListViewModel(taskDescriptions);
  }
}
