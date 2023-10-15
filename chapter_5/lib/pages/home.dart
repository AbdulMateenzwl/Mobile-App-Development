// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _buildHorizantelRow(),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                _buildRowAndColumn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildHorizantelRow() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 40.0,
          width: 40.0,
        ),
        Padding(
          padding: EdgeInsets.all(16),
        ),
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 40,
            width: 40,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
        ),
        Container(
          color: Colors.brown,
          height: 40,
          width: 40,
        )
      ],
    );
  }
}

class _buildRowAndColumn extends StatelessWidget {
  const _buildRowAndColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.yellow,
              height: 60,
              width: 60,
            ),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Container(
              color: Colors.amber,
              height: 40,
              width: 40,
            ),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Container(
              color: Colors.brown,
              height: 20,
              width: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 100,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        color: Colors.amber,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Text('End of line'),
          ],
        )
      ],
    );
  }
}
