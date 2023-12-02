import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variables for tracking image position and scale
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        fit: StackFit.expand,
        children: [
          _transformScaleAndTranslate(),
          //_transformMatrix4(), // Comment out for now
          _positionedStatusBar(context),
        ],
      ),
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
    );
  }

  // Gesture handlers for scaling and translating the image
  void _onScaleStart(ScaleStartDetails details) {
    setState(() {
      _startLastOffset = details.localFocalPoint;
      _lastOffset = details.localFocalPoint;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      // Calculate the current scale based on the previous scale and the new scale factor
      _currentScale = _lastScale * details.scale;

      // Calculate the current offset based on the previous offset, the current scale,
      // and the new focal point
      final offsetDelta = details.localFocalPoint - _lastOffset;
      _currentOffset += offsetDelta * _currentScale;

      // Update the last offset and scale for the next update
      _lastOffset = details.localFocalPoint;
      _lastScale = _currentScale;
    });
  }

  void _onDoubleTap() {
    setState(() {
      _currentScale = 1.0;
      _currentOffset = Offset.zero;
    });
  }

  void _onLongPress() {
    // Handle long press gesture
    print('Long press detected');
  }

  // Transform widgets for scaling and translating the image
  Widget _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image(
          image: AssetImage('assets/images/elephant.jpg'),
        ),
      ),
    );
  }

  // Transform widget using Matrix4 for scaling and translating the image
  // (Comment out for now)
  Widget _transformMatrix4() {
    return Transform(
      transform: Matrix4.identity()
        ..scale(_currentScale, _currentScale)
        ..translate(_currentOffset.dx, _currentOffset.dy),
      alignment: FractionalOffset.center,
      child: Image(
        image: AssetImage('assets/images/elephant.jpg'),
      ),
    );
  }

  // Positioned widget for showing the gesture status bar
  Widget _positionedStatusBar(BuildContext context) {
    return Positioned(
      top: 0.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Scale: ${_currentScale.toStringAsFixed(4)}'),
            Text('Current: $_currentOffset'),
          ],
        ),
      ),
    );
  }
}
