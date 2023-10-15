import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 150.0,
      child: Card(
        elevation: 8.0,
        color: Colors.white,
        //shape: StadiumBorder(),
        //shape: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange.withOpacity(0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'UET Airport',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48.0,
                  color: Colors.orange),
            ),
            Text(
              'Travel Plans',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
