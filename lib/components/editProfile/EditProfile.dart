import '../../importer.dart';

class EditProfile extends StatelessWidget {
  EditProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('プロフィールの編集')),
      body: Container(
        child: Text('プロフィールの編集'),
      ),
    );
  }
}
