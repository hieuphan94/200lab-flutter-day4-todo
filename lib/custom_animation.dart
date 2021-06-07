import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils.dart';

class CustomAnimation extends StatefulWidget {
  @override
  _CustomAnimationState createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation> {
  SharedAxisTransitionType? _transitionType =
      SharedAxisTransitionType.horizontal;

  SharedAxisTransitionType? _horizontalType =
      SharedAxisTransitionType.horizontal;
  SharedAxisTransitionType? _verticalType = SharedAxisTransitionType.horizontal;

  bool _isReverse = false;

  void setIsRevers() {
    setState(() {
      _isReverse = !_isReverse;
      if (_transitionType == _horizontalType) {
        _transitionType = _verticalType;
      } else {
        _transitionType = _horizontalType;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: setIsRevers,
          child: Icon(Icons.circle),
        ),
        appBar: AppBar(
          title: Text('Animation container'),
        ),
        body: SafeArea(
          child: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 300),
              reverse: _isReverse,
              transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: _transitionType!);
              },
              child: _isReverse ? UIOne() : UITwo()),
        ));
  }
}

class UIOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Text(
          'Streamling your courses',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Bundled categories appear as groups in your feed. '
            'You can always change this later.',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class UITwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(
            5,
            (index) => Container(
                  height: 50,
                  color: randomColor(),
                )).toList());
  }
}
