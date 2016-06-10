part of controller;

/**
 * Created by Ning on 06/08/2016.
 */
class TodoAppController {
  final TaskRepository _iTaskRepos;
  final ToolbarView _toolbarView = new ToolbarView();
  final AddTaskView _addTaskView = new AddTaskView();

  TaskListViewModel _vm;
  ListTasksView _listTasksView;
  TotalTasksView _totalTasksView;

  TodoAppController(this._iTaskRepos) {
    /**
     * Translate model to view model.
     */
    _vm = _transformModelDataToVM(_iTaskRepos);
    _totalTasksView = new TotalTasksView(_vm);
    _totalTasksView.hide();

    _addTaskView.onAddTaskRequest.listen(_handleAddTaskRequest);
    _toolbarView.onShowListRequest.listen((e) {
      _handleShowListRequest();
    });
    _toolbarView.onShowTotalRequest.listen((e) {
      _handleShowTotalRequest();
    });
  }

  void start() {
    _listTasksView = new ListTasksView(_vm);
  }

  void _addTask(String taskDescription) {
    _iTaskRepos.addTask(new Task(taskDescription, false));
    _vm.addTask(taskDescription);
  }

  void _handleAddTaskRequest(String message) {
    _addTask(message);
  }

  void _handleShowListRequest() {
    _listTasksView.show();
    _totalTasksView.hide();
  }

  void _handleShowTotalRequest() {
    _listTasksView.hide();
    _totalTasksView.show();
  }

  TaskListViewModel _transformModelDataToVM(TaskRepository repos) {
    List<String> taskDescriptions = [];

    for (Task task in repos.tasks) {
      if (!task.completed) {
        taskDescriptions.add(task.description);
      }
    }
    return new TaskListViewModel(taskDescriptions);
  }
}
