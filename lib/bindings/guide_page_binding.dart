import 'package:get/get.dart';
import 'package:subero_mobile/data/repository/sample_repository.dart';
import 'package:subero_mobile/data/provider/sample_provider.dart';
import 'package:subero_mobile/controller/guide/guide_controller.dart';

class GuidePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuideController>(
      () {
        return GuideController(
          repository: SampleRepository(
            sampleProvider: SampleProvider(),
          ),
        );
      },
    );
  }
}
