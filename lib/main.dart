import 'package:flutter/material.dart';
import 'package:stich_finalappproject/Repositories/DataService.dart';
//import 'package:stich_finalapp/Models/LoginStructure.dart';
import 'package:stich_finalappproject/aboutPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Stich Mobile App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final DataService dataService = DataService();

  var usernameController = new TextEditingController();
  var passwordController = new TextEditingController();

  void onLoginButtonPress () {
    setState(() {
      final username = usernameController.text;
      final password = passwordController.text;

      if (username == dataService.usernameKey && password == dataService.passwordKey) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Success"),
          ),
        );
      }
      else {
        if (username != dataService.usernameKey && password == dataService.passwordKey)  {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Username does not exist"),
          ),
        );
        }
        else if (username == dataService.usernameKey && password != dataService.passwordKey)  {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password is incorrect"),
          ),
        );
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Incorrect username and password"),
          ),
        );
        }
      }
    });
  }

  void onAboutButtonPress () {
    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => aboutPage()),
                );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Text("Please Sign In"),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(hintText: "Username"), 
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(hintText: "Password"), 
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: onLoginButtonPress, child: Text("Sign In"),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: onAboutButtonPress, child: Text("About"),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Version 1.0.1"),
            ),
          ],
        ),
      ), 
    );
  }
}

