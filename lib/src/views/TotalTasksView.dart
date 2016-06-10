part of views;

/**
 * Created by Ning on 06/09/2016.
 */
class TotalTasksView {
  UListElement _tasksDisplay;
  TaskListViewModel _vm;

  TotalTasksView(TaskListViewModel vm) {
    _tasksDisplay = querySelector('#to-do-total-list');
    _tasksDisplay.children.clear();

    _vm = vm;
    print(_vm);
    _updateNumOfTasks();
    _vm.onTaskAdded.listen(_handleChangeInVM);
  }

  void hide() {
    _tasksDisplay.style.display = 'none';
  }

  void show() {
    _tasksDisplay.style.display = 'block';
  }

  void _handleChangeInVM(String task) {
    _updateNumOfTasks();
  }

  void _updateNumOfTasks() {
    var totalTaskDisplay = new LIElement();

    totalTaskDisplay.text = _vm.tasks.length;
    _tasksDisplay.children.clear();
    _tasksDisplay.children.add(totalTaskDisplay);
  }
}
