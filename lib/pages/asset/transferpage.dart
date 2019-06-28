import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nbc_wallet/api/model/jsonEntity.dart';
import 'package:nbc_wallet/api/transfer.dart';

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
  // String _hash = '';
  TextEditingController addrController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController hashController = TextEditingController();
  String queryState = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addrController.text =
        '1118hfRMRrJMgSCoV9ztyPcjcgcMZ1zThvqRDLUw3xCYkZwwTAbJ5o';
    amountController.text = '1';
    hashController.text =
        '2a70905f28f2cb8ef6f9a4d1a055709df733fd5cf350a8038a973cd409f74f37';
  }

  _showSuccess(TxnSuccessInfo res) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('交易成功'),
            content: Text('${res.height},${res.confirm}'),
          );
        });
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
              maxLines: 2,
              controller: this.addrController,
            ),
            TextFieldOutLine(
              labelText: '转账金额',
              controller: this.amountController,
            ),
            TextFieldOutLine(
              labelText: '交易生成hash',
              maxLines: 2,
              controller: this.hashController,
              changed: (v) {
                print('v:$v');
                setState(() {
                  this.hashController.text = v;
                });
              },
            ),
            Row(
              children: <Widget>[
                Text(
                  this.queryState,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldOutLine(
              labelText: '备注',
              maxLines: 3,
            ),
            SizedBox(
              height: 260,
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
                      onPressed: () {
                        // transfer('', '').then((res) {
                        //   setState(() {
                        //     this.hashController.text = res;
                        //   });
                        // });
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    child: RaisedButton(
                      color: Colors.cyan,
                      textColor: Colors.white,
                      child: Text('查 询'),
                      onPressed: () {
                        //2a70905f28f2cb8ef6f9a4d1a055709df733fd5cf350a8038a973cd409f74f37
                        print('界面上传来的哈希值:${this.hashController.text}');
                        getQueryTxnHashResult(this.hashController.text)
                            .then((res) {
                          String r;
                          if (res == null) {
                            r = '哈希错误';
                          } else {
                            if (res.successInfo != null) {
                              r = '交易完成:height(${res.successInfo.height})/confirm(${res.successInfo.confirm})/idx(${res.successInfo.idx})';
                            } else {
                              r = '正在确认状态:${res.stateInfo}';
                            }
                          }
                          print('$r');
                          setState(() {
                            this.queryState = r;
                          });
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class TextFieldOutLine extends StatefulWidget {
  final String labelText;
  final int maxLines;
  Icon suffix;
  TextEditingController controller;
  // final String controlText;
  String controllerText;
  final changed;

  TextFieldOutLine(
      {Key key,
      this.labelText = '',
      this.maxLines = 1,
      this.suffix,
      this.controllerText,
      this.controller,
      this.changed})
      : super(key: key);

  _TextFieldOutLineState createState() => _TextFieldOutLineState(
      labelText, maxLines, suffix, controllerText, controller, changed);
}

class _TextFieldOutLineState extends State<TextFieldOutLine> {
  // final TextEditingController controller;

  final labelText;
  final maxLines;
  Icon suffix;
  String controllerText;
  TextEditingController controller;
  final changed;

  _TextFieldOutLineState(this.labelText, this.maxLines, this.suffix,
      this.controllerText, this.controller, this.changed);

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
            // controller: TextEditingController(text: this.controllerText),
            // onSubmitted: changed,
            controller: this.controller,
            onChanged: changed,

            // onEditingComplete: changed,
            // onChanged: (v) {
            //   print('Onchanged v:$v');
            //   setState(() {
            //     this.controllerText = v;
            //   });
            // },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
