import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "../../data/model/user_model.dart";
import '../../data/repository/user_repository.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final GetStorage box = GetStorage();
  final UserRepository repository;
  // String userId = "1";

  final _user = UserModel().obs;
  set user(value) => this._user.value = value;
  get user => this._user.value;

  final _fileName = <String, String>{
    "value": "",
  }.obs;
  get fileName => this._fileName["value"];
  set fileName(value) => this._fileName["value"] = value;

//編集前の情報を取得してから、それを書き換えて、firebaseに入れればいかなと思ったけど、うまい書き方が分からんから力技気味。
  EditProfileController({required this.repository}) {
  String userId = box.read("userId");
    Future<UserModel> userInformation = repository.getUser(userId);
    userInformation.then((data) {
      _user.value.name = data.name;
      _user.value.introduction = data.introduction;
      _user.value.accountType = data.accountType;
      _user.value.career = data.career;
      _user.value.favoriteTrick = data.favoriteTrick;
      _user.value.sponser = data.sponser;
      _user.value.license = data.license;
      _user.value.homeSkiResort = data.homeSkiResort;
      _user.value.createdAt = data.createdAt;
      _user.value.editedAt = data.editedAt;
      _user.value.iconUrl = data.iconUrl;
      _user.value.videoUrl = data.videoUrl;
    });
  }

  editImage() async {
  String userId = box.read("userId");
    //image pickerでファイルを選択
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final fileName = path.basename(pickedFile!.path);
    final file = File(pickedFile.path);
    try {
      //選択したファイルをアップロードして、そのurlをコントローラに保存
      String url = await repository.uploadImage(file, userId, fileName);
      _user.value.iconUrl = url;
    } catch (e) {
      print("controller error :$e");
      rethrow;
    }
  }

  editVideo() async {
  String userId = box.read("userId");
    //image pickerでファイルを選択
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    final fileName = path.basename(pickedFile!.path);
    final file = File(pickedFile.path);
    _fileName["value"] = fileName;
    try {
      //選択したファイルをアップロードして、そのurlをコントローラに保存
      String url = await repository.uploadVideo(file, userId, fileName);
      _user.value.videoUrl = url;
    } catch (e) {
      print("controller error :$e");
      rethrow;
    }
  }

  editProfile() async {
  String userId = box.read("userId");
    try {
      _user.value.editedAt = DateTime.now();

      await repository.editProfile(_user.value, userId);
      Get.back();
    } catch (e) {
      print("Controller Error: $e");
    }
  }
}
