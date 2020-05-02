import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_clist/model/shopping.dart';

class IconBasket extends StatelessWidget {
  final Shopping _shopping;

  IconBasket(this._shopping);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Icon(
          Icons.shopping_basket,
          color: _shopping.isBuy ? Colors.green : null,
        ));
  }
}
