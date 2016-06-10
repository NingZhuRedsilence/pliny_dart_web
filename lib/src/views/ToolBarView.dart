part of views;

 class ToolbarView
{
  ButtonElement _listButton;

  ButtonElement _totalsButton;

  //broadcast or single subscription? For now, only one listener, but in the future?
  final StreamController _onListClickedController = new StreamController.broadcast();

  Stream get onViewListRequest => _onListClickedController.stream;

  final StreamController _onTotalsClickedController = new StreamController.broadcast();

  Stream get onViewTotalRequest => _onTotalsClickedController.stream;

   ToolbarView()
  {
    _listButton = querySelector('#view-list-button');
    _totalsButton = querySelector('#view-total-button');

    _listButton.onClick.listen((e) {_showList();});
    _totalsButton.onClick.listen((e) {_showTotal();});

  }

  void _showList() {
    _onListClickedController.add(null);
  }

  void _showTotal() {
    _onTotalsClickedController.add(null);
  }
}
