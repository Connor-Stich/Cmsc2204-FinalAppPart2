import 'package:flutter/material.dart';
import 'package:stich_finalappproject/Models/Team.dart';
//import 'package:stich_finalappproject/Models/Team.dart';
import 'package:stich_finalappproject/Repositories/DataService.dart';
import 'package:stich_finalappproject/Repositories/UserClient.dart';
import 'package:stich_finalappproject/aboutPage.dart';
import 'package:stich_finalappproject/itemList.dart';

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
      home: MyHomePage(title: 'Stich Mobile App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final UserClient userClient = UserClient();
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DataService dataService = DataService();

  var usernameController = new TextEditingController();
  var passwordController = new TextEditingController();

  var teams = new List.empty(growable: true);

  void onLoginButtonPress () {
    setState(() {
      var username = usernameController.text;
      var password = passwordController.text;

      if (username == dataService.usernameKey && password == dataService.passwordKey) {
        /*
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Success"),
          ),
        );
        */
        setState(() {
          widget.userClient.GetTeamsAsync().then((response) => onGetTeamsSuccess(response));
         });
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

  void onGetTeamsSuccess(List<NBATeam>? teams) 
  {
    setState(() {
      if(teams != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => itemList(inTeams: teams)));
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
                Text("Please Sign In", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
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

