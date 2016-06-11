part of views;

/**
 * Created by Ning on 06/09/2016.
 */
class TotalTasksView {
  final UListElement _displayArea = querySelector('#to-do-total-list');
  final TaskListViewModel _vm;

  TotalTasksView(this._vm) {
    _displayArea.children.clear();
    _updateNumberOfTasks();

    _vm.onTaskAdded.listen(_handleTaskAddedToVM);
  }

  void hide() {
    _displayArea.style.display = 'none';
  }

  void show() {
    _displayArea.style.display = 'block';
  }

  void _handleTaskAddedToVM(String task) {
    _updateNumberOfTasks();
  }

  void _updateNumberOfTasks() {
    var totalNumberDisplay = new LIElement();
    totalNumberDisplay.text = _vm.tasks.length;

    _displayArea.children.clear();
    _displayArea.children.add(totalNumberDisplay);
  }
}
