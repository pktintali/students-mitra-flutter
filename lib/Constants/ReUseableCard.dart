import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReUseableCard extends StatelessWidget {
  ReUseableCard(
      {@required this.colour,
      this.onPress,
      this.isGameZone = false,
      this.cardtext});
  final Color colour;
  final String cardtext;
  final Function onPress;
  final bool isGameZone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(24.0),
        color: colour,
        child: InkWell(
          onTap: onPress,
          splashColor: Colors.green,
          borderRadius: BorderRadius.circular(24.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  cardtext,
                  style: TextStyle(fontSize: 20.0),
                ),
                !isGameZone?Text(
                  "Subject",
                  style: TextStyle(fontSize: 20.0),
                ):Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
