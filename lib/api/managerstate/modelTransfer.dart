import 'package:flutter/foundation.dart';

class ModelTransfer with ChangeNotifier {
  String _recvAddr;
  double _amount;
  String _txnHash;
  String _lastUock;
  String get recvAddr => _recvAddr;
  double get amount => _amount;
  String get txnHash => _txnHash;
  String get lastUock => _lastUock;

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
}
