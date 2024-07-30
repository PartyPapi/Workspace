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
  bool _showError = false;

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
      setState(() {
        _showError = true;
      });
    }
  }

  void _retry() {
    setState(() {
      _showError = false;
      _nameController.clear();
      _passwordController.clear();
    });
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
            if (_showError)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Sie haben leider eine falsche Name/Passwortkombination eingegeben. Möchten Sie mit einer neuen Anmeldung fortfahren oder es nochmal versuchen?",
                      style: TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _retry,
                          child: const Text("Zurück"),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/custom_form');
                          },
                          child: const Text("Weiter"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            if (!_showError)
              Column(
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
