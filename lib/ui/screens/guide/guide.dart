import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class Guide extends StatelessWidget {
  Guide();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ガイド'),
      ),
      body: myDropDown(),
    );
  }

  Widget guideTest() {
    List colors = [Colors.red, Colors.green, Colors.blue, Colors.black, Colors.yellow];
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (int i = 0; i < 4; i++) LessonCardSmall(LessonModel(hostName: 'izuru', lessonName: 'sampleLesson')),
      ],
    );
  }

  Widget myDropDown() {
    GuideController c = Get.put(GuideController());
    return Column(
      children: [
        Obx(() => Text(c.select)),
        Obx(
          () => DropdownButton<String>(
            hint: Text(c.select),
            // onChanged: (value) => c.setSelected(value!),
            onChanged: (value) => c.select = value!,
            // items: c.listType.map((selectedType) {
            //   return DropdownMenuItem<String>(
            //     child: Text(selectedType),
            //     value: selectedType,
            //   );
            // }),
            items: [for (int i = 0; i < 4; i++) DropdownMenuItem(value: i.toString(), child: Text(i.toString()))],
          ),
        ),
      ],
    );
  }
}

class GuideController extends GetxController {
  final _select = 'default value of observable varias'.obs;
  set select(value) => this._select.value = value;
  get select => this._select.value;

  void setSelected(String value) {
    _select.value = value;
  }

  final listType = ['1', '2', '3', '4'];
}
