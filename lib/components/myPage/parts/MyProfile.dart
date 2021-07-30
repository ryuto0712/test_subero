// #todo: スノボ歴～～の表示
import '../../../importer.dart';
import 'index.dart';

class MyProfile extends StatefulWidget {
  String userName;
  String description;
  Map<String, String> ProfileMap;
  String video;
  MyProfile(this.userName, this.description, this.ProfileMap, this.video);
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              MyPageIcon(widget.video),
              _userName(widget.userName),
              _userDescription(widget.description),
              _profileEditButton(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: ContractingLessons(),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }

  Widget _userName(String userName) {
    return Container(
      child: Text(userName),
    );
  }

  Widget _userDescription(String description) {
    return Container(
      width: 300, child: ExpandableText(description),
      // #todo: スノボ歴～～の表示
    );
  }

  Widget _profileEditButton() {
    return Container(
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfilePage())),
        child: Text('プロフィールを編集する'),
      ),
    );
  }
}
