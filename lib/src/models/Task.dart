part of models;

class Task {
  final String _description;

  bool _completed = false;

  Task(this._description, this._completed);

  bool get completed => _completed;

  set completed(bool value) => _completed = value;

  String get description => _description;
}
