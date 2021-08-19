import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/routes/app_routes.dart';
import "../../data/model/user_model.dart";
import '../../data/repository/user_repository.dart';



class EditProfileController extends GetxController{
  final GetStorage box = GetStorage();
  final UserRepository repository;
  // String userId = box.read("userId");
  String userId = "1";

  final  _user = UserModel().obs;
  set user(value) => this._user.value = value;
  get user => this._user.value;

//編集前の情報を取得してから、それを書き換えて、firebaseに入れれ売いかなと思ったけど、うまい書き方が分からんから力技気味。
  EditProfileController({required this.repository}){
    Future<UserModel> userInformation = repository.getUser(userId);
    userInformation.then((data){
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

  editProfile()async{
    try{
      _user.value.editedAt = DateTime.now();

      await repository.editProfile(_user.value,userId);
      // Get.toNamed(Routes.MYPAGE);
      Get.back();
    }
    catch(e){
      print("Controller Error: $e");
    }
  }
}