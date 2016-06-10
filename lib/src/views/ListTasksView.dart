part of views;

/**
 * Created by Ning on 6/7/2016.
 */

class ListTasksView {
  UListElement _displayArea;
  TaskListViewModel _vm;

  ListTasksView(TaskListViewModel vm) {
    _displayArea = querySelector('#to-do-list');
    _displayArea.children.clear();
    _vm = vm;
    _displayDataFromVM(_vm);

    _vm.onTaskAdded.listen(_handleChangeInVM);
  }

  void hide() {
    _displayArea.style.display = 'none';
  }

  void show() {
    _displayArea.style.display = 'block';
  }

  void _addTaskDescToDisplay(String taskDesc) {
    var newTaskDesc = new LIElement();
    newTaskDesc.text = "\n" + taskDesc;
    _displayArea.children.add(newTaskDesc);
  }

  void _displayDataFromVM(TaskListViewModel vm) {
    _displayArea.children.clear();
    for (String taskDesc in vm.tasks) {
      _addTaskDescToDisplay(taskDesc);
    }
  }

  void _handleChangeInVM(String task) {
    _addTaskDescToDisplay(task);
  }
}
