part of views;

/**
 * Created by nz9 on 6/2/2016.
 */
class AddTaskView {
  final ButtonElement _btnAddTask = querySelector('#add-task-button');
  final InputElement _inputBox = querySelector('#to-do-input');

  final StreamController<String> _onAddTaskRequestedController =
      new StreamController.broadcast();
  Stream<String> get onAddTaskRequested => _onAddTaskRequestedController.stream;

  AddTaskView() {
    _btnAddTask.onClick.listen((e) {
      _addTodoItem();
    });
  }

  void _addTodoItem() {
    String taskDescription = _inputBox.value;
    _onAddTaskRequestedController.add(taskDescription);
  }
}
