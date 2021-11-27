import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Image.asset(
            'assets/zorro.jpg',
            height: 250.0,
          )),
          SizedBox(
            height: 15.0,
          ),
          _userTextField(),
          SizedBox(
            height: 15.0,
          ),
          _passwordTextField(),
          SizedBox(
            height: 20.0,
          ),
          _buttonLogin(),
        ],
      ))),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo Electrónico',
            ),
            onChanged: (value) {},
          ));
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Contraseña',
              labelText: 'Contraseña',
            ),
            onChanged: (value) {},
          ));
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10.0,
        color: Colors.blue,
        onPressed: () {},
      );
    });
  }
}
