part of views;

/**
 * Created by Ning on 6/7/2016.
 */

class ListTasksView {
  final UListElement _displayArea = querySelector('#to-do-list');
  final TaskListViewModel _vm;

  ListTasksView(this._vm) {
    _displayArea.children.clear();
    _displayDataFromVM(_vm);

    _vm.onTaskAdded.listen(_handleTaskAddedToVM);
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

  void _handleTaskAddedToVM(String task) {
    _addTaskDescToDisplay(task);
  }
}
