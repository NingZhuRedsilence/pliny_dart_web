part of view_models;
/**
 * Created by Matt on 5/31/2016.
 */
class TaskListViewModel
{
  final List<String> _tasksDesc = [];
<<<<<<< HEAD
  //keep McVVM & its purpose in mind, don't create type dependencies b/w
  //(couple) classes that might compile without each other
  // e.g. no model (Task) in viewModels etc.
  final StreamController<String> _onAddTaskController = new StreamController.broadcast();
  Stream<String> get onTaskAdded => _onAddTaskController.stream;

  TaskListViewModel(Iterable<String> tasks)
  {
    for (String task in tasks)
    {
      _tasksDesc.add(task);
=======
  final StreamController<Task> _onChangeController = new StreamController.broadcast();
  Stream<Task> get onChange => _onChangeController.stream;
  //final EventController<String> _onChange = new EventController<>();
  // final Event<String> OnChange = _onChange;

  TaskListViewModel(Iterable<Task> tasks)
  {
    for (Task task in tasks)
    {
      _tasksDesc.add(task.description);
>>>>>>> 51832a0e9a4f99eb98c207d69dd0f854f4e7838c
    }
  }

  Iterable<String> get tasks => _tasksDesc;

<<<<<<< HEAD
  bool addTask(String task) {
    //fire an event in the views when change happens
    //_onChange.fireEvent(task);
    //add an event to stream
    _onAddTaskController.add(task);
    if (_tasksDesc.indexOf(task) >= 0){
      return false;
    }
    else {
      _tasksDesc.add(task);
=======
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
>>>>>>> 51832a0e9a4f99eb98c207d69dd0f854f4e7838c
      return true;
    }
  }

}
