import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';
import 'package:subero_mobile/ui/screens/index.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class Host extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 140),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Get.to(UserPage(), id: null),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: 75,
                height: 75,
                child: NetworkCircleImage(75, imageUrl: c.lesson.hostIcon),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(UserPage(), id: null),
                        child: Text(c.lesson.hostName),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Icons.star_rate, color: Colors.yellow),
                            Text(c.lesson.hostRating.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
