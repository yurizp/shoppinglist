import 'package:flutter/material.dart';
import 'package:shopping_clist/screen/list_of_shopping_list.dart';
import 'package:shopping_clist/screen/register_list_of_shopping_list.dart';

void main() => runApp(StartShopppingList());

class StartShopppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListOfShoppingList(),
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          accentColor: Colors.blueAccent,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent,
            focusColor: Colors.blue,
            textTheme: ButtonTextTheme.primary,
          ),
          buttonColor: Colors.blueAccent),
    );
  }
}
