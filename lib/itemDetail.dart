

import 'package:flutter/material.dart';
import 'package:stich_finalappproject/Models/Team.dart';

class ItemDetail extends StatelessWidget {
  final NBATeam team;

  ItemDetail({required this.team});

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Team Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/basketball.jpg'), // Replace with the actual image asset
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                team.fullName,
                style: TextStyle(
                  fontSize: 30, // Adjust the font size as needed
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 15), 
              ListTile(
                title: Text('ID', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('${team.id}'),
                tileColor: Colors.transparent,
              ),
              ListTile(
                title: Text('Abbreviation', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('${team.abbreviation}'),
                tileColor: Colors.transparent,
              ),
              ListTile(
                title: Text('City', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('${team.city}'),
                tileColor: Colors.transparent,
              ),
              ListTile(
                title: Text('Conference', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('${team.conference}'),
                tileColor: Colors.transparent,
              ),
              ListTile(
                title: Text('Division', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('${team.division}'),
                tileColor: Colors.transparent,
              ),
              ListTile(
                title: Text('Name', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('${team.name}'),
                tileColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                  'Back to Team List',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}