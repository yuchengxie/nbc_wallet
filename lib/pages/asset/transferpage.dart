import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  TransferPage({Key key}) : super(key: key);

  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('NBC-转账'),
          backgroundColor: Colors.cyan,
        ),
        body: TransferComponent(),
      ),
    );
  }
}

class TransferComponent extends StatefulWidget {
  TransferComponent({Key key}) : super(key: key);

  _TransferComponentState createState() => _TransferComponentState();
}

class _TransferComponentState extends State<TransferComponent> {
  // var _username = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            TextFieldOutLine(
              labelText: '收款人的钱包地址',
              controllerText: '1118hfRMRrJMgSCoV9ztyPcjcgcMZ1zThvqRDLUw3xCYkZwwTAbJ5o',
            ),
            TextFieldOutLine(
              labelText: '转账金额',
              controllerText: '1',
            ),
            TextFieldOutLine(
              labelText: '备注',
              maxLines: 3,
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    child: RaisedButton(
                      color: Colors.cyan,
                      textColor: Colors.white,
                      child: Text('交 易'),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class TextFieldOutLine extends StatefulWidget {
  final String labelText;
  final int maxLines;
  Icon suffix;
  // final String controlText;
  String controllerText;

  TextFieldOutLine(
      {Key key,
      this.labelText = '',
      this.maxLines = 1,
      this.suffix,
      this.controllerText})
      : super(key: key);

  _TextFieldOutLineState createState() =>
      _TextFieldOutLineState(labelText, maxLines, suffix, controllerText);
}

class _TextFieldOutLineState extends State<TextFieldOutLine> {
  // final TextEditingController controller;

  final labelText;
  final maxLines;
  Icon suffix;
  String controllerText;

  _TextFieldOutLineState(
      this.labelText, this.maxLines, this.suffix, this.controllerText);

  @override
  Widget build(BuildContext context) {
    // print('c:${this.controller}');
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            maxLines: this.maxLines,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              border: OutlineInputBorder(),
              labelText: this.labelText,
              suffix: this.suffix,
            ),
            // controller: this.controller,
            controller: TextEditingController(text: this.controllerText),
            onChanged: (v) {
              print('Onchanged v:$v');
              setState(() {
                this.controllerText = v;
              });
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
