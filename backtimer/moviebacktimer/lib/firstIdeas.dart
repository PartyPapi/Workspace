import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(PredatorClockApp());
}

class PredatorClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Predator Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PredatorClockScreen(),
    );
  }
}

class PredatorClockScreen extends StatefulWidget {
  @override
  _PredatorClockScreenState createState() => _PredatorClockScreenState();
}

class _PredatorClockScreenState extends State<PredatorClockScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  late Timer _timer;
  late Timer _blinkTimer;
  int _duration = 60; // Default duration
  bool _isRunning = false;
  bool _isBlinking = false;
  bool _invertColors = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _duration),
    );
    _animation = StepTween(
      begin: _duration,
      end: 0,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
        if (_controller.isCompleted) {
          _startBlinking();
        }
      });
  }

  void _startTimer() {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
    });
    _controller.duration = Duration(seconds: _duration);
    _controller.forward(from: 0);
  }

  void _stopTimer() {
    if (!_isRunning) return;
    setState(() {
      _isRunning = false;
      _isBlinking = false;
    });
    _controller.stop();
    _blinkTimer.cancel();
    _invertColors = false;
  }

  void _startBlinking() {
    _isBlinking = true;
    _blinkTimer = Timer.periodic(Duration(milliseconds: 1000 ~/ 5), (timer) {
      setState(() {
        _invertColors = !_invertColors;
      });
    });

    // Stop blinking after a certain duration, e.g., 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      _blinkTimer.cancel();
      setState(() {
        _isBlinking = false;
        _invertColors = false;
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _controller.dispose();
    _blinkTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _invertColors ? Colors.white : Colors.black,
      appBar: AppBar(
        title: Text('Predator Clock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: PredatorClockPainter(_animation.value, _invertColors),
              child: Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    _formatTime(_animation.value),
                    style: TextStyle(
                      color: _invertColors ? Colors.black : Colors.green,
                      fontSize: 40,
                      fontFamily: 'Digital-7', // Add a digital-style font
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Timer Duration (seconds)',
                labelStyle: TextStyle(color: Colors.green),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              style: TextStyle(color: Colors.green),
              onChanged: (value) {
                setState(() {
                  _duration = int.tryParse(value) ?? 60;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PredatorClockPainter extends CustomPainter {
  final int value;
  final bool invertColors;

  PredatorClockPainter(this.value, this.invertColors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = invertColors ? Colors.black : Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
