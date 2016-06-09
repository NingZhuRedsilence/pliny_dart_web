part of controller;

/**
 * Created by Ning on 06/08/2016.
 */
 class ToDoAppController
{
  final TaskRepository _repos;

  TaskListViewModel _vm ;

  //changed _listTasksView to non-final 'cos I need to assign value based on _vm
  //either this or keep final and use a factory for _listTasksView
  ListTasksView _listTasksView;

  TotalTasksView _totalTasksView;

  final AddTaskView _addTaskView = new AddTaskView();

  ToDoAppController(this._repos)
 {
    /**
     * Translate model to view model.
     */
   _vm = _translateToVM(_repos);
   //ok to put this line at the initialization line? Since whatever the vw changes to will notify the view?
    // nope --> compilation error: 'controller#_vm' is only available in instance methods
   _addTaskView.onAddRequest.listen(_handleAddTaskRequest);

 }

  void start()
  {
    _listTasksView = new ListTasksView(_vm);
    _totalTasksView = new TotalTasksView(_vm);
    //need to refactor the views into _masterView
    //_masterView.showView();
  }
  //where to validate changing tasks? Check for duplicates? Null-checker?
  //In controller because it controls model, viewModels & views?

  void _handleAddTaskRequest(String message)
  {
    //System.out.println("Controller got message from View: " + message );
    _addTask(message);
  }

//  void _handleListButtonClicked(Void forget)
//  {
//    //_masterView.setDisplayView(_listTasksView);
//  }
//
//  void _handleTotalsButtonClicked(Void forget)
//  {
//   // _masterView.setDisplayView(_totalsTaskView);
//  }

  void _addTask(String taskDescription) {
    //create a task and add to the domain model

    _repos.addTask(new Task(taskDescription, false));

    _vm.addTask(taskDescription);

  }

  TaskListViewModel _translateToVM(TaskRepository repos) {
    List<String> taskDescriptions = [] ;
  // Should make the list a field in controller or not? Don't think so
  // the data is save in view model
    for (Task task in repos.tasks)
    {
      if (!task.completed){
      taskDescriptions.add(task.description);
      }
    }

    return new TaskListViewModel(taskDescriptions);
  }

}
