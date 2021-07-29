import '../importer.dart';

class BeforePurchase extends StatelessWidget {
  BeforePurchase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('購入ページ')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/before_purchase.png'),
          ],
        ),
      ),
    );
  }
}
