import 'package:flutter/material.dart';

class PlaceDatePrice extends StatelessWidget {
  final String place;
  final String date;
  final int price;
  final num lessonDuration;

  PlaceDatePrice({
    required this.place,
    required this.date,
    required this.price,
    required this.lessonDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.red.shade400,
                  size: 25,
                ),
                Text(place)
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Colors.blue.shade400,
                  size: 25,
                ),
                Text(date)
              ],
            ),
          ],
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            '¥' + price.toString() + '円',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '/' + lessonDuration.toString() + '時間',
            style: TextStyle(fontSize: 15),
          ),
        ])
      ],
    ));
  }
}
