import 'package:flutter/material.dart';
import 'package:khanos/src/preferences/user_preferences.dart';
import 'package:khanos/src/providers/auth_provider.dart';
import 'package:khanos/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  // final usuarioProvider = new UsuarioProvider();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _prefs = new UserPreferences();

  String url = '';
  String username = '';
  String password = '';
  late ThemeData currentThemeData;
  bool? _darkTheme;
  // TextEditingController _urlController = new TextEditingController();
  // TextEditingController _usernameController = new TextEditingController();
  // TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    _darkTheme = _prefs.darkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentThemeData =
        _darkTheme == true ? ThemeData.dark() : ThemeData.light();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _createFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    // final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: currentThemeData.cardColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text('Setup', style: TextStyle(fontSize: 20.0)),
                    SizedBox(height: 30.0),
                    _createurl(),
                    SizedBox(height: 15.0),
                    _createUsername(),
                    SizedBox(height: 15.0),
                    _createPassword(),
                    SizedBox(height: 25.0),
                    _tfaWarning(),
                    SizedBox(height: 10.0),
                    _loginButton(context)
                  ],
                )),
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _createurl() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
          initialValue: _prefs.url,
          decoration: InputDecoration(
            icon:
                Icon(Icons.swap_horizontal_circle_outlined, color: Colors.blue),
            hintText: 'https://YOUR_KANBOARD_URL/',
            labelText: 'Kanboard URL',
          ),
          onChanged: (value) {
            url = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Must specify an url URL!';
            }
            return null;
          }),
    );
  }

  Widget _createUsername() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
          initialValue: _prefs.username,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Colors.blue),
            hintText: 'cloudstrife',
            labelText: 'Username',
          ),
          onChanged: (value) {
            username = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Must provide an email!';
            }
            return null;
          }),
    );
  }

  Widget _createPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
          initialValue: _prefs.password,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.blue),
              labelText: 'Password'),
          onChanged: (value) {
            password = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Must provide a password!';
            }
            return null;
          }),
    );
  }

  Widget _loginButton(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            style: ButtonStyle(elevation: MaterialStateProperty.all(5.0)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Login'),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showLoaderDialog(context);
                _login(context);
              } else {
                mostrarAlerta(context, 'Please fill all the fields');
              }
            });
      },
    );
  }

  _login(BuildContext context) async {
    if (url == '') url = _prefs.url;
    if (username == '') username = _prefs.username;
    if (password == '') password = _prefs.password;

    await AuthProvider().login(url, username, password).then((value) {
      Navigator.pop(context);
      setState(() {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      });
    }).catchError((error) {
      Navigator.pop(context);
      mostrarAlerta(context, 'Error: ${error['message']}');
    });

    // Navigator.pop(context);
    // if (authResult) {
    //   setState(() {
    //     Navigator.pushReplacementNamed(context, 'home');
    //   });
    // } else {
    //   mostrarAlerta(context, 'Couldn\'t connect to your server!');
    // }
  }

  Widget _createFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: <Color>[Colors.blue, Colors.deepPurple])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.check_circle_outline,
                  color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('khanos App',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }

  Widget _tfaWarning() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Text(
          'Note: Since Kanboard 1.2.8, If you have 2FA enabled you must use an API key as password'),
    );
  }
}
