part of models;

class Task {
  final String _description;
  String get description => _description;

  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;
  set isCompleted(bool value) => _isCompleted = value;

  Task(this._description, this._isCompleted);


}
