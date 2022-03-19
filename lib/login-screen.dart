import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week3project/home-screen.dart';
import 'package:week3project/register-screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _validateUsername = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.network(
                  'https://vi.seaicons.com/wp-content/uploads/2017/03/hamburger-icon-3.png')),
          Align(
            alignment: Alignment.center,
            child: const Text("Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffdf4f11),
                    fontSize: 40),
                textAlign: TextAlign.center),
          ),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Username: ',
                style: TextStyle(fontSize: 20),
              )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                controller: _username,
                decoration: InputDecoration(
                    errorText:
                        _validateUsername ? 'Username can\'t be empty' : null,
                    fillColor: Color.fromARGB(255, 223, 221, 215),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 5, right: 5))),
          ),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Password: ',
                style: TextStyle(fontSize: 20),
              )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: _password,
              decoration: InputDecoration(
                errorText:
                    _validatePassword ? 'Password can\'t be empty' : null,
                fillColor: Color.fromARGB(255, 223, 221, 215),
                filled: true,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _validateUsername = _username.text.isEmpty;
                  });

                  setState(() {
                    _validatePassword = _password.text.isEmpty;
                  });

                  if (_username.text.isNotEmpty != true ||
                      _password.text.isNotEmpty != true) {
                    return;
                  }

                  Navigator.push(
                      context,
                      // Create the SelectionScreen in the next ste.
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                color: const Color(0xffdf4f11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'or',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      // Create the SelectionScreen in the next ste.
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));

                  setState(() {
                    _username.text = result.toString();
                  });
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xffdf4f11),
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
