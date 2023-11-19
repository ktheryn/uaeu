import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isHighlighted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 0.3).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void _toggleHighlight() {
    if (_isHighlighted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isHighlighted = !_isHighlighted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/UAEU 3D.png'),
          ),
          GestureDetector(
              onTap: () {
                _toggleHighlight();
              },
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Align(
                      alignment: const Alignment(-0.2, 0.25),
                      child: Container(
                        height: 200,
                        width: 200,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.yellow.withOpacity(_animation.value)
                        ),
                        child: const Text(
                          'Tap me to highlight!',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    );
                  }
              )
          ),
        ],
      ),
    );
  }
}
