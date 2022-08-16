import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    this._controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rotateAnimation =
        Tween<double>(begin: 0, end: pi).animate(this._controller);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: rotateAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: rotateAnimation.value,
                    child: child,
                  );
                },
                child: const FlutterLogo(size: 72.0),
              ),
              ElevatedButton(
                onPressed: () => _controller.forward(),
                child: const Text('Forward animation'),
              ),
              ElevatedButton(
                onPressed: () => _controller.reverse(),
                child: const Text('Reverse animation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
