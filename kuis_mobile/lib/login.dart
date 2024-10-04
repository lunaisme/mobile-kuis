import 'package:flutter/material.dart';
import 'package:kuis_mobile/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLogin = true;
  bool visible = true;

  _navigatePage() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(nama: username);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[200],
          title: Text(
            'Login Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Image.asset('images/upnLogo.png'),
                  SizedBox(height: 20),
                  _usernameField(),
                  _passwordField(),
                  _loginButton(context)
                ],
              ),
            )));
  }

// ini bikin field untuk username
  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          // prefixIcon: Icon(Icons.people)
        ),
      ),
    );
  }

// ini bikin field untuk password
  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              icon: Icon(visible ? Icons.visibility : Icons.visibility_off)),
          labelText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          // prefixIcon: Icon(Icons.people)
        ),
      ),
    );
  }

  // bikin login button
  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'admin' && password == 'admin') {
            setState(() {
              text = 'login berhasil';
              isLogin = true;
              _navigatePage();
            });
          } else {
            text = 'login gagal';
            isLogin = false;
          }
          SnackBar snackBar = SnackBar(
            backgroundColor: isLogin ? Colors.green : Colors.red,
            content: Text(text),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Login'),
      ),
    );
  }
}
