import 'package:flutter/material.dart';
import 'package:global_keys/widget/button_widget.dart';
import 'package:global_keys/widget/text_row_widget.dart';

class FormKeyPage extends StatefulWidget {
  @override
  _FormKeyPageState createState() => _FormKeyPageState();
}

class _FormKeyPageState extends State<FormKeyPage> {
  final formKey = GlobalKey<FormState>();
  final usernameKey = GlobalKey<FormFieldState<String>>();
  final passwordKey = GlobalKey<FormFieldState<String>>();

  bool isSignedIn = false;
  String email = '';
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Global Keys'),
          centerTitle: true,
        ),
        body: isSignedIn ? buildHome() : buildLogin(),
      );

  Widget buildLogin() => Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && !value.contains('@')
                  ? 'Not a Valid Email!'
                  : null,
              onSaved: (value) => email = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              key: usernameKey, // Added GlobalKey for the username field
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Username needs 3 characters.'
                  : null,
              onSaved: (value) => username = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              key: passwordKey, // Added GlobalKey for the password field
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Password needs 3 characters.'
                  : null,
              onSaved: (value) => password = value!,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Submit',
              onClicked: submit,
            ),
          ],
        ),
      );

  Widget buildHome() => Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextRowWidget(title: 'Email', value: email),
            TextRowWidget(title: 'User', value: username),
            TextRowWidget(title: 'Password', value: password),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Sign Out',
              onClicked: () => setState(() => isSignedIn = false),
            ),
          ],
        ),
      );

  void submit() {
    final form = formKey.currentState!;

    if (form.validate()) {
      form.save();

      setState(() => isSignedIn = true);
    }
  }
}
