part of controller;

/**
 * Created by Ning on 06/08/2016.
 */
 class ToDoAppController
{
  final TaskRepository _repos;

  TaskListViewModel _vm ;
  ListTasksView _listTasksView;
  TotalTasksView _totalTasksView;
  final ToolbarView _toolbarView = new ToolbarView();
  // MasterView is to contain and set positions for all views.
  // This role is fulfilled by index.html

  final AddTaskView _addTaskView = new AddTaskView();

  ToDoAppController(this._repos)
 {
    /**
     * Translate model to view model.
     */
   _vm = _translateToVM(_repos);
   //ok to put this line at the initialization line? Since whatever the vw changes to will notify the view?
    // nope --> compilation error: 'controller#_vm' is only available in instance methods
   //can't use (e) =>_handleAddTaskRequest here, not button result
   _totalTasksView = new TotalTasksView(_vm);
   _totalTasksView.hide();
   //_listTasksView = new ListTasksView(_vm);
  //commented out to fix the duplicating display of added task problem

   _addTaskView.onAddRequest.listen(_handleAddTaskRequest);

   //the above line requires void onData(String) as an argument but the line below asks for (dynamic) -> void?
   _toolbarView.onViewListRequest.listen((e){_handleListButtonClicked();});
   _toolbarView.onViewTotalRequest.listen((e) {_handleTotalsButtonClicked();});
 }

  void start()
  {
    _listTasksView = new ListTasksView(_vm);
    //need to refactor the views into _masterView?
  }
  //where to validate changing tasks? Check for duplicates? Null-checker?
  //In controller because it controls model, viewModels & views?

  void _handleAddTaskRequest(String message)
  {
    _addTask(message);
  }

  void _handleListButtonClicked()
  {
    // or, make a method update() or showView() in views with the body
    // _view = querySelector('#tag');
    print(_listTasksView);
    _listTasksView.show();
    _totalTasksView.hide();
  }

  void _handleTotalsButtonClicked()
  {
    print(_totalTasksView);
    _listTasksView.hide();
    _totalTasksView.show();

  }

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
