import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nbc_wallet/api/managerstate/stateModel.dart';
import 'package:nbc_wallet/api/model/jsonEntity.dart';
import 'package:nbc_wallet/api/transfer.dart';
import 'package:provider/provider.dart';

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
  TextEditingController addrController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController txnHashController = TextEditingController();
  TextEditingController lastUockController = TextEditingController();
  String _tranState = '';

  @override
  Widget build(BuildContext context) {
    final _stateModel = Provider.of<StateModel>(context);
    addrController.text = '${_stateModel.recvAddr}';
    amountController.text = '${_stateModel.amount}';
    txnHashController.text = '${_stateModel.txnHash}';
    lastUockController.text = '${_stateModel.lastUock}';
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
              controller: addrController,
              changed: (value) {
                _stateModel.updateAddr(value);
              },
            ),
            TextFieldOutLine(
              labelText: '转账金额',
              controller: amountController,
              changed: (value) {
                _stateModel.updateAddr(value);
              },
            ),
            TextFieldOutLine(
              labelText: '交易生成hash',
              maxLines: 2,
              controller: txnHashController,
              changed: (value) {
                _stateModel.updateTxnHash(value);
              },
            ),
            TextFieldOutLine(
              labelText: '最后uock',
              maxLines: 1,
              controller: lastUockController,
              changed: (value) {
                _stateModel.updateLastUock(value);
              },
            ),
            Text(
              this._tranState,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            Offstage(
              offstage: false,//true隐藏false显示
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '区块确认 1/8',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      value: 0.6,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
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
                        transfer('', '').then((res) {
                          _stateModel.updateTxnHash(res.txnHash);
                          _stateModel.updateLastUock(res.lastUock);

                          getQueryTxnHashResult(res.txnHash);
                        });
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
                        print('界面上传来的哈希值:${this.txnHashController.text}');
                        getQueryTxnHashResult(this.txnHashController.text)
                            .then((res) {
                          String r;
                          if (res == null) {
                            r = '哈希错误';
                          } else {
                            if (res.successInfo != null) {
                              r = '交易完成:height(${res.successInfo.height})/confirm(${res.successInfo.confirm})/idx(${res.successInfo.idx})';
                            } else {
                              r = '[${DateTime.now()}]: ${res.stateInfo}';
                            }
                          }
                          print('$r');
                          this._tranState = r;
                          _stateModel.updateTranState(this._tranState);
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
            enableInteractiveSelection: false,
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

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text("CircularProgressIndicator"),
//       ),
//       body:Center(child: CircularProgressIndicator(),),
//     );
//   }
// }
