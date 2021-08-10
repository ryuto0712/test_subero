import 'package:get/get.dart';
import 'package:subero_mobile/data/model/model.dart';
import 'package:subero_mobile/data/repository/posts_repository.dart';

class DetailsController extends GetxController {
  final MyRepository repository;
  DetailsController({required this.repository});

  final _post = MyModel().obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;

  //pratique
  editar(post) {
    print('editar');
  }

  //pratique
  delete(id) {
    print('deletar');
  }
}
