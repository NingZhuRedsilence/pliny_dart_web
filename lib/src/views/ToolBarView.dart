part of views;

class ToolbarView {
  final ButtonElement _showListButton = querySelector('#view-list-button');
  final ButtonElement _showTotalButton = querySelector('#view-total-button');

  final StreamController _onShowListRequestedController =
      new StreamController.broadcast();
  Stream get onShowListRequested => _onShowListRequestedController.stream;

  final StreamController _onShowTotalRequestedController =
      new StreamController.broadcast();
  Stream get onShowTotalRequested => _onShowTotalRequestedController.stream;

  ToolbarView() {
    _showListButton.onClick.listen((e) {
      _handleShowListRequested();
    });
    _showTotalButton.onClick.listen((e) {
      _handleShowTotalRequested();
    });
  }

  void _handleShowListRequested() {
    _onShowListRequestedController.add(null);
  }

  void _handleShowTotalRequested() {
    _onShowTotalRequestedController.add(null);
  }
}
