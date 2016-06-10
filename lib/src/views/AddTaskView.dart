part of views;

/**
 * Created by nz9 on 6/2/2016.
 */
class AddTaskView {
  ButtonElement _btnAddTask;
  String _taskName;
  InputElement _inputBox;
  final StreamController<String> _onAddTaskRequest =
      new StreamController.broadcast();

  AddTaskView() {
    _inputBox = querySelector('#to-do-input');
    _btnAddTask = querySelector('#add-task');
    _btnAddTask.onClick.listen((e) {
      _addToDoItem();
    });
  }

  Stream<String> get onAddRequest => _onAddTaskRequest.stream;

  String get taskName => _taskName;

  set taskName(String value) => _taskName = value;

  void _addToDoItem() {
    _taskName = _inputBox.value;
    print("adding " + _inputBox.value);
    _onAddTaskRequest.add(_taskName);
  }
}
