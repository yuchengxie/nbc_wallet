
import 'package:flutter/material.dart';
class ScanfCodePage extends StatefulWidget {
  ScanfCodePage({Key key}) : super(key: key);

  _ScanfCodePageState createState() => _ScanfCodePageState();
}

class _ScanfCodePageState extends State<ScanfCodePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('111'),
    );
  }

  
  // Future scan() async {
  //   try {
  //     String barcode = await BarcodeScanner.scan();
  //     setState(() {
  //       return this.barcode = barcode;
  //     });
  //   } on PlatformException catch (e) {
  //     if (e.code == BarcodeScanner.CameraAccessDenied) {
  //       setState(() {
  //         return this.barcode = 'The user did not grant the camera permission!';
  //       });
  //     } else {
  //       setState(() {
  //         return this.barcode = 'Unknown error: $e';
  //       });
  //     }
  //   } on FormatException{
  //     setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
  //   } catch (e) {
  //     setState(() => this.barcode = 'Unknown error: $e');
  //   }
  // }
}


  
