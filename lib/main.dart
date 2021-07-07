import 'package:flutter/material.dart';
import 'package:kanboard/src/pages/home_page.dart';
import 'package:kanboard/src/pages/login_page.dart';
import 'package:kanboard/src/pages/project_page.dart';
import 'package:kanboard/src/pages/subtask_page.dart';
import 'package:kanboard/src/pages/task_page.dart';
import 'package:kanboard/src/pages/welcome_page.dart';
import 'package:kanboard/src/preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  final Map<String, dynamic> preferences = {
    'endpoint': prefs.endpoint,
    'username': prefs.username,
    'password': prefs.password,
    'authFlag': prefs.authFlag
  };

  runApp(MyApp(preferences));
}

class MyApp extends StatelessWidget {
  MyApp(this.preferences);
  final Map<String, dynamic> preferences;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(preferences);
    String _initialRoute = '';

    if (preferences['endpoint'] == '' ||
        preferences['username'] == '' ||
        preferences['password'] == '') {
      _initialRoute = 'welcome';
    } else if (preferences['authFlag'] != true) {
      _initialRoute = 'login';
    } else {
      _initialRoute = 'home';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: _initialRoute,
      routes: {
        'home': (BuildContext context) => HomePage(),
        'project': (BuildContext context) => ProjectPage(),
        'task': (BuildContext context) => TaskPage(),
        'subtask': (BuildContext context) => SubtaskPage(),
        'welcome': (BuildContext context) => WelcomePage(),
        'login': (BuildContext context) => LoginPage(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
