part of controller;

/**
 * Created by Ning on 06/08/2016.
 */
class ToDoAppController {
  final TaskRepository _repos;

  TaskListViewModel _vm;
  ListTasksView _listTasksView;
  TotalTasksView _totalTasksView;
  final ToolbarView _toolbarView = new ToolbarView();

  final AddTaskView _addTaskView = new AddTaskView();

  ToDoAppController(this._repos) {
    /**
     * Translate model to view model.
     */
    _vm = _translateToVM(_repos);
    _totalTasksView = new TotalTasksView(_vm);
    _totalTasksView.hide();

    _addTaskView.onAddRequest.listen(_handleAddTaskRequest);
    _toolbarView.onViewListRequest.listen((e) {
      _handleListButtonClicked();
    });
    _toolbarView.onViewTotalRequest.listen((e) {
      _handleTotalsButtonClicked();
    });
  }

  void start() {
    _listTasksView = new ListTasksView(_vm);
  }

  void _addTask(String taskDescription) {
    _repos.addTask(new Task(taskDescription, false));
    _vm.addTask(taskDescription);
  }

  void _handleAddTaskRequest(String message) {
    _addTask(message);
  }

  void _handleListButtonClicked() {
    _listTasksView.show();
    _totalTasksView.hide();
  }

  void _handleTotalsButtonClicked() {
    _listTasksView.hide();
    _totalTasksView.show();
  }

  TaskListViewModel _translateToVM(TaskRepository repos) {
    List<String> taskDescriptions = [];

    for (Task task in repos.tasks) {
      if (!task.completed) {
        taskDescriptions.add(task.description);
      }
    }
    return new TaskListViewModel(taskDescriptions);
  }
}
