import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verify Code',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Inter',
      ),
      home: const VerifyCodeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  String _code = '';
  Timer? _timer;
  int _start = 48;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onKeyPress(String value) {
    setState(() {
      if (value == 'backspace') {
        if (_code.isNotEmpty) {
          _code = _code.substring(0, _code.length - 1);
        }
      } else if (_code.length < 4) {
        _code += value;
      }
    });
  }

  Widget _buildNumpadButton(String value, {bool isIcon = false}) {
    return Expanded(
      child: InkWell(
        onTap: () => _onKeyPress(value),
        customBorder: const CircleBorder(),
        child: Container(
          height: 80,
          alignment: Alignment.center,
          child: isIcon
              ? const Icon(Icons.backspace_outlined, color: Colors.black87)
              : Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpCircle(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: index < _code.length
            ? Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back arrow
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios_new, size: 20),
              ),
            ),
            const SizedBox(height: 40),

            // Main Content
            const Text(
              'Verify Code',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please enter the code we just sent to\nemail pristia@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),

            // OTP input circles
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => _buildOtpCircle(index)),
            ),
            const SizedBox(height: 30),

            // Resend timer
            Text(
              'Resend code in 00:${_start.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const Spacer(),

            // Numpad
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumpadButton('1'),
                      _buildNumpadButton('2'),
                      _buildNumpadButton('3'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumpadButton('4'),
                      _buildNumpadButton('5'),
                      _buildNumpadButton('6'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumpadButton('7'),
                      _buildNumpadButton('8'),
                      _buildNumpadButton('9'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumpadButton('.'),
                      _buildNumpadButton('0'),
                      _buildNumpadButton('backspace', isIcon: true),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}