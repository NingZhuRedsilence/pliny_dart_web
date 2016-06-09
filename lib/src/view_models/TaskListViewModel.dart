part of view_models;
/**
 * Created by Matt on 5/31/2016.
 */
class TaskListViewModel
{
  final List<String> _tasksDesc = [];
  //keep McVVM & its purpose in mind, don't create type dependencies b/w
  //(couple) classes that might compile without each other
  // e.g. no model (Task) in viewModels etc.
  final StreamController<String> _onAddTaskInModelController = new StreamController.broadcast();
  Stream<String> get onTaskAdded => _onAddTaskInModelController.stream;

  TaskListViewModel(Iterable<String> tasks)
  {
    for (String task in tasks)
    {
      _tasksDesc.add(task);
    }
  }

  Iterable<String> get tasks => _tasksDesc;

  bool addTask(String task) {
    //fire an event in the views when change happens
    //_onChange.fireEvent(task);
    //add an event to stream
    _onAddTaskInModelController.add(task);
    if (_tasksDesc.indexOf(task) >= 0){
      return false;
    }
    else {
      _tasksDesc.add(task);
      //print("testing model's to addBtn click");
      return true;
    }
  }

}
