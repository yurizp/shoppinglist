import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_clist/database/database.dart';
import 'package:shopping_clist/model/shopping.dart';
import 'package:shopping_clist/screen/register_list_of_shopping_list.dart';

const String testDevice = 'MobileTest';

class ListOfShoppingList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListOfShoppingListState();
  }
}

class ListOfShoppingListState extends State<ListOfShoppingList> {

  int activeIndex;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }


  void _setActivePodcast(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: FutureBuilder(
          future: findAllShopping(),
          builder: (context, snapshot) {
            final List<Shopping> transferencia = snapshot.data;
            transferencia.sort((a,b)=> a.compareTo(b));
            return ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return MyStatelessWidget(
                  shopping: transferencia[index],
                  listIndex: index,
                  isPlaying: activeIndex == index,
                  onPress: _setActivePodcast,
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RegisterListOfShoppingList();
            }));
          }),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final Shopping shopping;
  final bool isPlaying;
  final int listIndex;
  final Function(int index) onPress;

  MyStatelessWidget({
    Key key,
    this.shopping,
    this.listIndex,
    this.onPress,
    this.isPlaying: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.shopping_basket,
                key: Key("iconShoppingBasket"),
                color: shopping.isBuy ? Colors.green : null,
              ),
              title: Text(
                shopping.title,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                shopping.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: const Text('EXCLUIR'),
                  onPressed: () {
                    deleteShopping(shopping);
                    this.onPress(listIndex - 1);
                  },
                ),
                FlatButton(
                  child: Text(shopping.isBuy ? 'NÃO PEGUEI' : "PEGUEI"),
                  onPressed: () {
                    if (shopping.isBuy) {
                      shopping.isBuy = false;
                    } else {
                      shopping.isBuy = true;
                    }
                    update(shopping);
                    this.onPress(listIndex - 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
