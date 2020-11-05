import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_clist/database/database.dart';
import 'package:shopping_clist/model/shopping.dart';
import 'package:shopping_clist/screen/list_of_shopping_list.dart';

class RegisterListOfShoppingList extends StatelessWidget {
  final TextEditingController _textEditingControllerDescription =
      new TextEditingController();
  final TextEditingController _textEditingControllerTitle =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crie sua lista"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              key: Key("itemName"),
              controller: _textEditingControllerTitle,
              keyboardType: TextInputType.text,
              maxLength: 30,
              decoration: InputDecoration(
                  icon: Icon(Icons.border_color),
                  labelText: "Nome do item",
                  hintText: "Pão francês"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              key: Key("descriptionItem"),
              controller: _textEditingControllerDescription,
              keyboardType: TextInputType.text,
              maxLength: 60,
              decoration: InputDecoration(
                  icon: Icon(Icons.border_color),
                  labelText: "Observação",
                  hintText: "Pegar os mais tostados."),
            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            textColor: Colors.white,
            onPressed: () {
              final String _description =
                  _textEditingControllerDescription.text;
              final String _title = _textEditingControllerTitle.text;
              if (_title != null && _title.isNotEmpty) {
                saveShopping(new Shopping(
                    description: _description,
                    title: _title,
                    isDeleted: false,
                    isBuy: false));
              }

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return ListOfShoppingList();
              }));            },
          )
        ],
      ),
    );
  }
}
