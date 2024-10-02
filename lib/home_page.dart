import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const defaultWidth = 100.0;

class _MyHomePageState extends State<MyHomePage> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'People',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 370,
                ),
                width: _width,
                curve: _curve,
                child: Image.asset(
                  'assets/1.png',
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(
                () {
                  _isZoomedIn = !_isZoomedIn;
                  _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                  _width = _isZoomedIn
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                },
              );
            },
            child: Text(
              _buttonTitle,
            ),
          ),
        ],
      ),
    );
  }
}
