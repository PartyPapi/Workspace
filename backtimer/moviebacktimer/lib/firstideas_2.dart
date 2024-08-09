import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatefulWidget {
  @override
  _TimerHomePageState createState() => _TimerHomePageState();
}

class _TimerHomePageState extends State<TimerHomePage> {
  int _timerDuration = 0; // Eingestellte Zeit in Sekunden
  int _remainingTime = 0; // Verbleibende Zeit in Sekunden
  bool _isRunning = false;
  bool _isPaused = false;
  bool _isStopped = false;
  bool _isInverted = false; // Zustand für invertierte Farben
  Timer? _timer;

  TextEditingController _controller = TextEditingController();

  void _toggleTimer() {
    if (_isRunning) {
      _pauseTimer();
    } else {
      _startTimer();
    }
  }

  void _startTimer() {
    if (_timerDuration <= 0 && _remainingTime <= 0) return;

    if (_isStopped) {
      // Wenn Timer gestoppt war, Zeit zurücksetzen
      setState(() {
        _remainingTime = _timerDuration;
        _isStopped = false;
      });
    }

    setState(() {
      _isRunning = true;
      _isPaused = false;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) async {
      if (_remainingTime <= 0) {
        _stopTimer();
        await _onTimerComplete();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
      _isPaused = true;
    });
    _timer?.cancel();
  }

  void _stopTimer() {
    if (_isRunning || _isPaused) {
      // Timer anhalten
      setState(() {
        _isRunning = false;
        _isPaused = false;
        _isStopped = true;
      });
      _timer?.cancel();
    } else {
      // Zweites Drücken von Stopp setzt die Timer-Dauer auf 0 zurück
      setState(() {
        _timerDuration = 0;
        _remainingTime = 0;
        _controller.clear(); // Textfeld löschen
        _isStopped = false;
      });
    }
  }

  Future<void> _onTimerComplete() async {
    for (int i = 0; i < 15; i++) {
      // 15 Mal flackern (5 pro Sekunde für 3 Sekunden)
      await Future.delayed(Duration(milliseconds: 200));
      setState(() {
        _isInverted = !_isInverted;
      });
    }
    setState(() {
      _isInverted = false; // Farben zurücksetzen
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth =
        MediaQuery.of(context).size.width * 0.6; // 3/5 der Bildschirmbreite

    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        color: _isInverted ? Colors.black : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Enter duration in seconds'),
                  onChanged: (value) {
                    setState(() {
                      _timerDuration = int.tryParse(value) ?? 0;
                      _remainingTime =
                          _timerDuration; // Beim Start wird die eingegebene Zeit gesetzt
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    _formatTime(_remainingTime),
                    style: TextStyle(
                      fontSize: 48,
                      color: _isInverted ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _toggleTimer,
                    child: Text(_isRunning ? 'Pause' : 'Start'),
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
      ),
    );
  }
}
