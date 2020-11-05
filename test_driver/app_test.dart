import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Cadastro de itens de compra", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });

    test("Cadastrar novo e marcar como 'PEGUEI' depois desmarcar e excluir ",
        () async {
      await driver.tap(find.byType("FloatingActionButton"));
      SerializableFinder textFieldItemName = find.byValueKey("itemName");
      await driver.tap(textFieldItemName);
      await driver.enterText("text");
      await driver.tap(find.text("Salvar"));
      await Future.delayed(Duration(seconds: 5), () {
        assert(find.text("text") != null);
      });
      await driver.tap(find.text("PEGUEI"));
      await Future.delayed(Duration(seconds: 5), () {
        assert(find.text("NÃO PEGUEI") == null);
      });
      await driver.tap(find.byValueKey("iconShoppingBasket"));
      await Future.delayed(Duration(seconds: 5), () {
        assert(find.text("PEGUEI") != null);
      });
      await driver.tap(find.text("EXCLUIR"));
      await Future.delayed(Duration(seconds: 5), () {
        assert(find.text("text") == null);
      });
    });
  });
}
