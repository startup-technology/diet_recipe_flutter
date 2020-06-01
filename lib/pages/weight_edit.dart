import 'package:flutter/material.dart';

class WeightEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('目標体重を編集'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new TextField(
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              style: TextStyle(color: Colors.red),
              maxLines:1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '目標体重を入力してください',
                labelText: '体重 *',
              ),
            ),
            // FormBuilderTextField(
            //   attribute: "text",
            //   // style: Theme.of(context).textTheme.bodyText1,
            //   // decoration: InputDecoration(labelText: "Age"),
            //   // keyboardType: TextInputType.number,
            //   // validators: [
            //   //   FormBuilderValidators.numeric(),
            //   //   FormBuilderValidators.max(70),
            //   // ],
            // ),
            RaisedButton(
              child: Text('更新する'),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
            ),
            RaisedButton(
              child: Text('戻る'),
              onPressed: () {
                Navigator.pushNamed(context, '/target_weight_input');
              },
            ),
          ],
        )),
    );
  }
}
