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
    //order of assignment matters?
    _tasksDisplay = querySelector('#to-do-list');
    _tasksDisplay.children.clear();
    _vm = vm;
    _displayDataFromVM(_vm); //calls _addTaskDescToDisplay(task)
    //if comment out the above line, not duplication of task items and "X" is printed only once
    //somewhere somehow ListTasksView is called when adding tasks? Nope
    //if change the body of _displayDataFromVM into straight for-loop element.children.add(string)
    //no duplication either

    _vm.onTaskAdded.listen(_handleChangeInVM); // also calls _addTaskDescToDisplay()
    //so twice? Nope, commented out the line above, still printout X twice onLoad
    //meaning _displayDataFromVM can print out twice --> but there are 2 tasks so should print out twice

  }
  //error message "void is not a type?"
  //not an error, just WebStorm's compiler
  void _handleChangeInVM(String task)
  {
    _addTaskDescToDisplay(task);
  }

  void _displayDataFromVM(TaskListViewModel vm){
    _tasksDisplay.children.clear();
    for (String taskDesc in vm.tasks)
    {
//      var newTaskDesc = new LIElement();
//      newTaskDesc.text ="\n" + taskDesc;
//      _tasksDisplay.children.add(newTaskDesc);
      _addTaskDescToDisplay(taskDesc);
    }
  }

  void _addTaskDescToDisplay(String taskDesc) {
    print("X");
    var newTaskDesc = new LIElement();
    newTaskDesc.text ="\n" + taskDesc;
    _tasksDisplay.children.add(newTaskDesc);
  }

  // Or void show(Element e){ e.style.display = "block";} in controller?
  void show()
  {
    _tasksDisplay.style .display = 'block';
  }

  void hide()
  {
    _tasksDisplay.style .display = 'none';

  }
}
