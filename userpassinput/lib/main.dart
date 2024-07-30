import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Input Validation Example')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateName(String? value) {
    final regex = RegExp(r'^[a-zA-Z0-9 ]+$');
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Name can only contain letters, numbers, and spaces';
    }
    return null;
  }

  String? _validateCompany(String? value) {
    final regex = RegExp(r'^[a-zA-Z0-9 ]+$');
    if (value == null || value.isEmpty) {
      return 'Company cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Company can only contain letters, numbers, and spaces';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final regex = RegExp(r'^[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]+$');
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!regex.hasMatch(value)) {
      return 'Password contains invalid characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: _validateName,
          ),
          TextFormField(
            controller: _companyController,
            decoration: InputDecoration(labelText: 'Company'),
            validator: _validateCompany,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: _validatePassword,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String name = _nameController.text;
                  String company = _companyController.text;
                  String password = '*' * _passwordController.text.length;

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Submitted Data'),
                        content: Text(
                          'Name: $name\nCompany: $company\nPassword: $password',
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
