

import 'package:flutter/material.dart';
import 'package:stich_finalappproject/Models/Team.dart';
import 'package:stich_finalappproject/Repositories/UserClient.dart';
import 'package:stich_finalappproject/itemDetail.dart';


class itemList extends StatefulWidget{

  final UserClient userClient = UserClient();

  final List<NBATeam> inTeams;
  itemList({Key? key, required this.inTeams}) : super(key: key);


  @override
  State<itemList> createState() => _itemListViewState(inTeams);
}

class _itemListViewState extends State<itemList> {

  _itemListViewState(teams);
  late List<NBATeam> teams = widget.inTeams;

  void onReloadButtonPress () 
  {
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Items were reloaded"),
          ),
        );
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("View Teams"),
        ),
        body: ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, index) {
            final team = teams[index];
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                            Colors.orange,
                            Colors.deepOrange,
                            ], 
                  ), 
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.sports_basketball_rounded),
                      title: Text("Team Name: ${team.fullName}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      subtitle: Text("City: ${team.city}   Abbreviation: ${team.abbreviation}", style: TextStyle(color: Colors.white),),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetail(team: team),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onReloadButtonPress,
          child: Icon(Icons.refresh),
        ),
      ),
    );
    
  }
  


}




/*

body: SingleChildScrollView(
          child: Column(
            children: teams.map((team) {
              return Padding(
                padding: EdgeInsets.all(3),
                child: GestureDetector( 
                  
                  
                  onTap: () { 
                    onTeamClick();        
                  }, 
                  
                  
                    //height: 80, 
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                            Colors.orange,
                            Colors.deepOrange,
                            ],
                          )
                        ), 
                      child: Column(
          
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.sports_basketball_rounded),
                            title: Text("Team Name: ${team.fullName}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            subtitle: Text("City: ${team.city}   Abbreviation: ${team.abbreviation}", style: TextStyle(color: Colors.white),),
                            
                          ),
                        ],
                      ),
                    ), 
                  ), 
                ),
              );
            }).toList(),
          ),
        ),

        */