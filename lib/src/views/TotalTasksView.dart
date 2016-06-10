part of views;
/**
 * Created by Ning on 06/09/2016.
 */
 class TotalTasksView
{
  UListElement _tasksDisplay;
  TaskListViewModel _vm;

  TotalTasksView(TaskListViewModel vm)
  {
    //printout here works
    //grabbing the same element as the ListTasksView does, might be a problem
    //_tasksDisplay = querySelector('#to-do-list');
    // try a different element
    //Note 2: grabbing the same element as the ListTasksView does doesn't trigger a warning
    //But whoever gets called the last in controller gets the element for show
    _tasksDisplay = querySelector('#to-do-total-list');
    _tasksDisplay.children.clear();

    _vm = vm;
    print(_vm);
    _updateNumOfTasks();
    _vm.onTaskAdded.listen(_handleChangeInVM);

  }

  void _handleChangeInVM(String task)
  {
    //how to use String task?
    _updateNumOfTasks();
  }

  //this method is checked upon building even when the method is not called anywhere at all.
  void _updateNumOfTasks() {
    var totalTaskDisplay = new LIElement();
    //kept getting warning when building, used printing testing string, printing object,
    //labeled DOM for this view using dummy display content,
    //then sort of narrowed down to _vm.tasks.size().
    //Should have read doc before writing!!!!!!
    //but this is just one error, the real cause of the warning is the line below.
    //the concatenation of string and int and the assignment is wrong
    //totalTaskDisplay.text = "You have " + _vm.tasks.length + " tasks.";

    totalTaskDisplay.text = _vm.tasks.length;
    _tasksDisplay.children.clear();
    _tasksDisplay.children.add(totalTaskDisplay);
  }

  void show()
  {
    _tasksDisplay.style.display = 'block';
  }

  void hide()
  {
    _tasksDisplay.style.display = 'none';

  }
}
