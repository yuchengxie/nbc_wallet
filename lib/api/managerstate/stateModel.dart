import 'package:flutter/foundation.dart';

class StateModel with ChangeNotifier {
  String _recvAddr = '1118hfRMRrJMgSCoV9ztyPcjcgcMZ1zThvqRDLUw3xCYkZwwTAbJ5o';
  double _amount = 0.01;
  String _txnHash = '';
  String _lastUock = '';
  String _tranState = '';
  String get recvAddr => _recvAddr;
  double get amount => _amount;
  String get txnHash => _txnHash;
  String get lastUock => _lastUock;
  String get tranState => _tranState;

  void updateAddr(value) {
    _recvAddr = value;
    notifyListeners();
  }

  void updateAmount(value) {
    _amount = value;
    notifyListeners();
  }

  void updateTxnHash(value) {
    _txnHash = value;
    notifyListeners();
  }

  void updateLastUock(value) {
    _lastUock = value;
    notifyListeners();
  }

  void updateTranState(value){
    _tranState=value;
    notifyListeners();
  }
}
