part of views;

class ToolbarView {
  ButtonElement _listButton;

  ButtonElement _totalsButton;

  final StreamController _onListClickedController =
      new StreamController.broadcast();

  final StreamController _onTotalsClickedController =
      new StreamController.broadcast();

  ToolbarView() {
    _listButton = querySelector('#view-list-button');
    _totalsButton = querySelector('#view-total-button');

    _listButton.onClick.listen((e) {
      _showList();
    });
    _totalsButton.onClick.listen((e) {
      _showTotal();
    });
  }

  Stream get onViewListRequest => _onListClickedController.stream;

  Stream get onViewTotalRequest => _onTotalsClickedController.stream;

  void _showList() {
    _onListClickedController.add(null);
  }

  void _showTotal() {
    _onTotalsClickedController.add(null);
  }
}
