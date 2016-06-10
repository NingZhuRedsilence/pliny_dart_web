part of views;

class ToolbarView {
  ButtonElement _showListButton;
  ButtonElement _showTotalButton;

  final StreamController _onShowListRequestController =
      new StreamController.broadcast();

  final StreamController _onShowTotalRequestController =
      new StreamController.broadcast();

  ToolbarView() {
    _showListButton = querySelector('#view-list-button');
    _showTotalButton = querySelector('#view-total-button');

    _showListButton.onClick.listen((e) {
      _showList();
    });
    _showTotalButton.onClick.listen((e) {
      _showTotal();
    });
  }

  Stream get onShowListRequest => _onShowListRequestController.stream;

  Stream get onShowTotalRequest => _onShowTotalRequestController.stream;

  void _showList() {
    _onShowListRequestController.add(null);
  }

  void _showTotal() {
    _onShowTotalRequestController.add(null);
  }
}
