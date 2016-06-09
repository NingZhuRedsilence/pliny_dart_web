//DART removed interface keyword
//can use abstract class as an interface, but abstract class can't be instantiated
//or define a factory constructor to make it appear instantiable
//or use the implicit interface of a regular class?
//which one? Need to instantiate it for controller to use later.
//But why use interface not the model 'TaskRepositoryInMemory' in controller?
//No need of this explicit interface in DART project then?
// https://www.dartlang.org/docs/dart-up-and-running/ch02.html#implicit-interfaces

part of models;

abstract class TaskRepository
{
  //no "Collection" class in DART
  Iterable<Task> get tasks;
  //Reason to use Iterable: immutable, has size() method

  bool addTask(Task newTask);
}
// can't have abstract method in concrete classes
