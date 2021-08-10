import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

// class QandA extends StatelessWidget {
//   QandA();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('よくある質問'),
//       ),
//       body: Container(),
//     );
//   }
// }

class CountModel extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}

class QuestionAndAnswer extends StatelessWidget {
  QuestionAndAnswer();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (context) => CountModel(),
      child: Consumer<CountModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('title'),
          ),
          body: Center(
            child: Column(
              children: [
                Text('おしましたね？'),
                CountText(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class CountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${Provider.of<CountModel>(context).count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
