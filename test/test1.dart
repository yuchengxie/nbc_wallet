import 'package:buffer/buffer.dart';
import 'package:nbc_wallet/api/utils/utils.dart';
main(List<String> args) {
  //  after = int(safe_hex(after),16)
  var s='00c7d80000100001';
  var t=hexStrToBytes(s);
  print(t);
  ByteDataReader read=ByteDataReader();
  read.add(t);
  int a=read.readUint64();
  //72075186238179072 
  //56251014878068737
  print(a);
}