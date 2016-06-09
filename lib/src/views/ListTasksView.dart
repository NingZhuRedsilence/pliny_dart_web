part of views;

/**
 * Created by Ning on 6/7/2016.
 */

//web UI or console UI?
class ListTasksView
{
  UListElement _tasksDisplay;
  TaskListViewModel _vm;

  ListTasksView(TaskListViewModel vm)
  {
<<<<<<< HEAD
    //order of assignment matters?
    _tasksDisplay = querySelector('#to-do-list');
    _vm = vm;
    _displayDataFromVM(_vm);
    _vm.onTaskAdded.listen(_handleChangeInVM);


  }
//error message "void is not a type?"
  void _handleChangeInVM(String task)
  {
    _addTaskDescToDisplay(task);
=======
    _vm = vm;
    _displayDataFromVM(_vm);
    _vm.onChange.listen(_handleChangeInVM);
    _tasksDisplay = querySelector('#to-do-list');

  }
//error message "void is not a type?"
  void _handleChangeInVM(Task task)
  {
    //System.out.println("Controller got message from View: " + message );
    //var?
    _addTaskDescToDisplay(task.description);
>>>>>>> 51832a0e9a4f99eb98c207d69dd0f854f4e7838c
  }

  void _displayDataFromVM(TaskListViewModel vm){
    for (String taskDesc in vm.tasks)
    {
      _addTaskDescToDisplay(taskDesc);
    }
    // super.add(_tasksDisplay);
  }

  void _addTaskDescToDisplay(String taskDesc) {
    var newTaskDesc = new LIElement();
    newTaskDesc.text ="\n" + taskDesc;
    _tasksDisplay.children.add(newTaskDesc);
  }
}
