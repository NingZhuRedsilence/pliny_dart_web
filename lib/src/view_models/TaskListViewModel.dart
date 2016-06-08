part of view_models;
/**
 * Created by Matt on 5/31/2016.
 */
class TaskListViewModel
{
  final List<String> _tasksDesc = [];
  final StreamController<Task> _onChangeController = new StreamController.broadcast();
  Stream<Task> get onChange => _onChangeController.stream;
  //final EventController<String> _onChange = new EventController<>();
  // final Event<String> OnChange = _onChange;

  TaskListViewModel(Iterable<Task> tasks)
  {
    for (Task task in tasks)
    {
      _tasksDesc.add(task.description);
    }
  }

  Iterable<String> get tasks => _tasksDesc;

  bool addTask(Task task) {
    //fire an event in the views when change happens
    //_onChange.fireEvent(task);
    //add an event to stream
    _onChangeController.add(task);
    String desc = task.description;
    if (_tasksDesc.indexOf(desc) >= 0){
      return false;
    }
    else {
      _tasksDesc.add(desc);
      return true;
    }
  }

}
