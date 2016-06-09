part of models;


class Task

{
  //no keyword for public or private, private fields start with "_"
  final String _description;

  String get description => _description;

  //set description(String value) => _description = value;

  bool _completed = false;

  Task(this._description, this._completed);

  bool get completed => _completed;

  set completed(bool value) => _completed = value;
}
