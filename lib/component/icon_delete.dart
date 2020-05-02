import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_clist/database/database.dart';
import 'package:shopping_clist/model/shopping.dart';

class IconDelete extends StatelessWidget {
  final Shopping _shopping;

  IconDelete(this._shopping);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        deleteShopping(_shopping);
      },
      child: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          Icon(_shopping.isDeleted ? Icons.settings_backup_restore : Icons.delete), // icon-2
        ],
      ),
    );
  }
}