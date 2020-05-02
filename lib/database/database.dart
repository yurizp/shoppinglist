import 'package:path/path.dart';
import 'package:shopping_clist/model/shopping.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'shopping_clist.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute("DROP TABLE list_shopping_list");
      db.execute("CREATE TABLE list_shopping_list("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title TEXT, "
          "description TEXT, "
          "buy int, "
          "deleted int)");
    }, version: 3);
  });
}

Future<List<Shopping>> findAllShopping() {
  return createDatabase().then((db) {
    return db.query("list_shopping_list").then((shoppignsDb) {
      final List<Shopping> shoppigns = new List<Shopping>();
      for (Map<String, dynamic> shop in shoppignsDb) {
        shoppigns.add(
          new Shopping(
            id: shop['id'],
            title: shop['title'],
            isDeleted: shop["deleted"] == 1 ? true : false,
            isBuy: shop["buy"] == 1 ? true : false,
            description: shop['description'],
          ),
        );
      }
      return shoppigns;
    });
  });
}

Future<int> saveShopping(Shopping shopping) {
  return createDatabase().then((db) {
    final Map<String, dynamic> shoppingMap = new Map();
    shoppingMap['buy'] = shopping.isBuy  ? 1 : 0;
    shoppingMap['deleted'] = shopping.isDeleted ? 1 : 0;
    shoppingMap['title'] = shopping.title;
    shoppingMap['description'] = shopping.description;
    return db.insert("list_shopping_list", shoppingMap);
  });
}

Future<int> deleteShopping(Shopping shopping) {
  return createDatabase().then(
    (db) {
      final Map<String, dynamic> shoppingMap = new Map();
      shoppingMap['id'] = shopping.id;
      return db.delete("list_shopping_list",
          where: 'id = ?', whereArgs: [shopping.id]);
    },
  );
}

Future<int> update(Shopping shopping) {
  return createDatabase().then((db) {
    final Map<String, dynamic> shoppingMap = new Map();
    shoppingMap['buy'] = shopping.isBuy  ? 1 : 0;
    shoppingMap['deleted'] = shopping.isDeleted ? 1 : 0;
    shoppingMap['title'] = shopping.title;
    shoppingMap['description'] = shopping.description;
    return db.update("list_shopping_list", shoppingMap,where: 'id = ?', whereArgs: [shopping.id]);
  });
}
