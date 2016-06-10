part of views;

/**
 * Created by Ning on 06/09/2016.
 */
class TotalTasksView {
  UListElement _displayArea;
  TaskListViewModel _vm;

  TotalTasksView(TaskListViewModel vm) {
    _displayArea = querySelector('#to-do-total-list');
    _displayArea.children.clear();

    _vm = vm;
    _updateNumberOfTasks();

    _vm.onTaskAdded.listen(_handleChangeInVM);
  }

  void hide() {
    _displayArea.style.display = 'none';
  }

  void show() {
    _displayArea.style.display = 'block';
  }

  void _handleChangeInVM(String task) {
    _updateNumberOfTasks();
  }

  void _updateNumberOfTasks() {
    var totalNumberDisplay = new LIElement();
    totalNumberDisplay.text = _vm.tasks.length;

    _displayArea.children.clear();
    _displayArea.children.add(totalNumberDisplay);
  }
}
