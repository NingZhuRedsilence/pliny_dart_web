part of views;

/**
 * Created by Ning on 6/7/2016.
 */

class ListTasksView {
  UListElement _tasksDisplay;
  TaskListViewModel _vm;

  ListTasksView(TaskListViewModel vm) {
    _tasksDisplay = querySelector('#to-do-list');
    _tasksDisplay.children.clear();
    _vm = vm;
    _displayDataFromVM(_vm);

    _vm.onTaskAdded.listen(_handleChangeInVM);
  }

  void hide() {
    _tasksDisplay.style.display = 'none';
  }

  void show() {
    _tasksDisplay.style.display = 'block';
  }

  void _addTaskDescToDisplay(String taskDesc) {
    var newTaskDesc = new LIElement();
    newTaskDesc.text = "\n" + taskDesc;
    _tasksDisplay.children.add(newTaskDesc);
  }

  void _displayDataFromVM(TaskListViewModel vm) {
    _tasksDisplay.children.clear();
    for (String taskDesc in vm.tasks) {
      _addTaskDescToDisplay(taskDesc);
    }
  }

  void _handleChangeInVM(String task) {
    _addTaskDescToDisplay(task);
  }
}
