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
