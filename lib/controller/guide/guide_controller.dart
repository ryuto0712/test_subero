import 'package:get/get.dart';
import 'package:subero_mobile/data/model/sample_medel.dart';
import 'package:subero_mobile/data/repository/sample_repository.dart';

class GuideController extends GetxController {
  final SampleRepository repository;
  GuideController({required this.repository});

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  getData(String id) async {
    print('getData method in GuideController is running. The id is $id');
    try {
      final SampleModel sampleModel = await this.repository.getData(id);
      this._obj.value = sampleModel.name;
      print('Explored data is ${_obj.value}');
    } catch (e) {
      print('controller error: $e');
    }
  }
}
