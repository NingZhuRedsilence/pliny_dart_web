part of views;

/**
 * Created by nz9 on 6/2/2016.
 */
class AddTaskView {
  InputElement _inputBox;
  ButtonElement _btnAddTask;
  String _taskName;

  final StreamController<String> _onAddTaskRequest = new StreamController.broadcast();
  Stream<String> get onAddRequest => _onAddTaskRequest.stream;

  String get taskName => _taskName;
  set taskName(String value) => _taskName = value;

  AddTaskView() {
    _inputBox = querySelector('#to-do-input');
    _btnAddTask = querySelector('#add-task');
    _btnAddTask.onClick.listen((e) { _addToDoItem(); });
  }

  void _addToDoItem()
  {
    //can print here
    //print("adding " + _inputBox.value);
    _taskName = _inputBox.value;
    //couldn't add on 06/08, but can add on 06/09 morning without any changes...
    print("adding " + _inputBox.value);
    _onAddTaskRequest.add(_taskName);
  }
}

