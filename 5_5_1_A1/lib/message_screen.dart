import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<String> userMessages = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _controller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 161, 207),
        title: const Text("Text Input App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: userMessages.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(userMessages[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: "Enter Message...",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
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
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userMessages.insert(0, _controller.text);
                      _controller.clear();
                    });
                  },
                  child: const Text("Send Message"),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            )
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
