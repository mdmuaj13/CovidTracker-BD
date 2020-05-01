import 'package:flutter/material.dart';

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;

  const SymptomCard({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10.0,
            color: Colors.grey[200],
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset("$image"),
          Text("$title"),
        ],
      ),
    );
  }
}
