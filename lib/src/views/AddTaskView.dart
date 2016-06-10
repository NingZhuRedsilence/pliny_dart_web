part of views;

/**
 * Created by nz9 on 6/2/2016.
 */
class AddTaskView {
  ButtonElement _btnAddTask;
  String _taskDescription;
  InputElement _inputBox;
  final StreamController<String> _onAddTaskRequestController =
      new StreamController.broadcast();

  AddTaskView() {
    _inputBox = querySelector('#to-do-input');
    _btnAddTask = querySelector('#add-task');
    _btnAddTask.onClick.listen((e) {
      _addTodoItem();
    });
  }

  Stream<String> get onAddTaskRequest => _onAddTaskRequestController.stream;

  void _addTodoItem() {
    _taskDescription = _inputBox.value;
    _onAddTaskRequestController.add(_taskDescription);
  }
}
