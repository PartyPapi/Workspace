import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    final String name = _nameController.text;
    final String password = _passwordController.text;

    if (name == 'Ralf' && password == 'letsgo') {
      Navigator.pushReplacementNamed(context, '/welcome');
    } else {
      Navigator.pushReplacementNamed(context, '/custom_form');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 161, 207),
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 16),
            showHidePassword(
              hidePassword: _hidePassword,
              passwordField: (hidePassword) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: hidePassword,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                    hintText: "password",
                  ),
                );
              },
              iconSize: 18,
              visibleOffIcon: Icons.visibility,
              visibleOnIcon: Icons.visibility_off,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }

  Widget showHidePassword({
    required bool hidePassword,
    required Widget Function(bool) passwordField,
    required double iconSize,
    required IconData visibleOffIcon,
    required IconData visibleOnIcon,
  }) {
    return Column(
      children: [
        passwordField(hidePassword),
        IconButton(
          icon: Icon(
            hidePassword ? visibleOffIcon : visibleOnIcon,
            size: iconSize,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        ),
      ],
    );
  }
}
