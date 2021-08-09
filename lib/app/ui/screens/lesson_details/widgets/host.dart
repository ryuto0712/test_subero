import 'package:flutter/material.dart';
import 'package:subero_mobile/app/ui/screens/index.dart';

class Host extends StatelessWidget {
  const Host(this.hostName, this.hostIcon, this.rating, {Key? key}) : super(key: key);
  final String hostName;
  final String hostIcon;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 140),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage())),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
                image: DecorationImage(fit: BoxFit.fill, image: AssetImage(hostIcon)),
              ),
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage())),
                      child: Text(hostName),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.star_rate, color: Colors.yellow),
                          Text(rating.toString()),
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
    );
  }
}
