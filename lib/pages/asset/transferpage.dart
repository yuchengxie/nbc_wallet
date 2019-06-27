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
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextFieldOutLine(
              labelText: '收款地址',
            ),
            TextFieldOutLine(
              labelText: '备注',
              maxLines: 3,
            ),
            TextFieldFlat(),
            // TextFieldDIY(
            //   labelText: '收款人钱包地址',
            //   suffix: Icon(Icons.wifi),
            // ),
            // TextFieldDIY(
            //   labelText: '转账金额',
            // ),
            // TextFieldDIY(
            //   labelText: '备注',
            //   maxLines: 3,
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

class TextFieldFlat extends StatelessWidget {
  const TextFieldFlat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
      ),
    );
  }
}

class TextFieldOutLine extends StatefulWidget {
  final String labelText;
  final int maxLines;
  Icon suffix;
  TextFieldOutLine(
      {Key key, this.labelText = '', this.maxLines = 1, this.suffix})
      : super(key: key);

  _TextFieldOutLineState createState() =>
      _TextFieldOutLineState(labelText, maxLines, suffix);
}

class _TextFieldOutLineState extends State<TextFieldOutLine> {
  final labelText;
  final maxLines;
  Icon suffix;
  _TextFieldOutLineState(this.labelText, this.maxLines, this.suffix);
  @override
  Widget build(BuildContext context) {
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
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
