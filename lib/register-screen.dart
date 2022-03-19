import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  bool _validateName = false;
  bool _validateUsername = false;
  bool _validatePassword = false;
  bool _validateConfirmPassword = false;
  String _validateConfirmPasswordText = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                        'https://vi.seaicons.com/wp-content/uploads/2017/03/hamburger-icon-3.png'),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdf4f11),
                          fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Name: ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _name,
                        decoration: InputDecoration(
                            errorText:
                                _validateName ? 'Name can\'t be empty' : null,
                            fillColor: Color.fromARGB(255, 223, 221, 215),
                            filled: true,
                            enabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 5, right: 5))),
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
                            errorText: _validateUsername
                                ? 'Username can\'t be empty'
                                : null,
                            fillColor: Color.fromARGB(255, 223, 221, 215),
                            filled: true,
                            enabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 5, right: 5))),
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
                        errorText: _validatePassword
                            ? 'Password can\'t be empty'
                            : null,
                        fillColor: Color.fromARGB(255, 223, 221, 215),
                        filled: true,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Confirm Password: ',
                        style: TextStyle(fontSize: 20),
                      )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      controller: _confirmpassword,
                      decoration: InputDecoration(
                        errorText: _validateConfirmPassword
                            ? _validateConfirmPasswordText
                            : null,
                        fillColor: Color.fromARGB(255, 223, 221, 215),
                        filled: true,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 20,
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _validateName = _name.text.isEmpty;
                          });

                          setState(() {
                            _validateUsername = _username.text.isEmpty;
                          });

                          setState(() {
                            _validatePassword = _password.text.isEmpty;
                          });

                          if (_confirmpassword.text.isNotEmpty != true) {
                            _validateConfirmPasswordText =
                                'Confirm password can\'t be empty';

                            setState(() {
                              _validateConfirmPassword =
                                  _confirmpassword.text.isEmpty;
                            });
                          } else if (_confirmpassword.text != _password.text) {
                            _validateConfirmPasswordText =
                                'Password mismatch';

                            setState(() {
                              _validateConfirmPassword = true;
                            });
                          } else {
                            setState(() {
                              _validateConfirmPassword = false;
                            });
                          }

                          if (_validateName || _validateUsername || _validatePassword || _validateConfirmPassword) {
                            return;
                          } else {
                            Navigator.of(context).pop(_username.text);
                          }
                        },
                        child: const Text(
                          "REGISTER",
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
                  )
                ],
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(''),
                icon: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
