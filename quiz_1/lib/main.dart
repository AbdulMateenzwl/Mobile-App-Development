import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orientation Handling App',
      home: OrientationDemo(),
    );
  }
}

class OrientationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Orientation Demo'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OrientationLayoutIconsWidget(),
                        SizedBox(height: 20.0),
                        OrientationLayoutWidget(),
                        SizedBox(height: 20.0),
                        GridViewWidget(),
                        SizedBox(height: 20.0),
                        OrientationBuilderWidget(),
                      ],data entry is a togh job  in tsiwr.t
                    )))));
  }
}


class OrientationLayoutIconsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: orientation == Orientation.portrait
          ? [Icon(Icons.star), Icon(Icons.star_border)]
          : [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star_border),
              Icon(Icons.star_border)
            ],
    );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      color: orientation == Orientation.portrait ? Colors.yellow : Colors.green,
      width: 200.0,
      height: 200.0,
    );
  }
}

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final crossAxisCount = orientation == Orientation.portrait ? 2 : 4;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          margin: EdgeInsets.all(8.0),
          child: Center(
            child: Text('Item $index'),
          ),
        );
      },
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container(
          color: orientation == Orientation.portrait
              ? Colors.yellow
              : Colors.green,
          width: 200.0,
          height: 200.0,
        );
      },
    );
  }
}
