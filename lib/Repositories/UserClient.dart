import 'package:dio/dio.dart';
import 'package:stich_finalappproject/Models/Team.dart';
//import 'package:stich_finalappproject/Repositories/DataService.dart';
import 'dart:convert';

const String BaseUrl = "https://www.balldontlie.io/api/v1";

class UserClient {
  final _dio = Dio(BaseOptions(baseUrl: BaseUrl));

  List<NBATeam> teamsList = [];


  //DataService _dataService = DataService();

  Future<List<NBATeam>?> GetTeamsAsync() async {
    try {

      var response = await _dio.get("/teams");

      //String responseData = response.data.toString();
      //String serializedData = json.encode(response.data);

      List<NBATeam> teams = parseTeams(json.encode(response.data));

      return teams;

    } catch(error) {
      print(error);
      return null;
    }
  }

  Future<bool> GetItemDetails(int id) async {
    try {
      var response = await _dio.get("teams/$id");

      return response.data['success'];

    } catch (error) {
      print(error);
      return false;
    }
  }

}
  




List<NBATeam> parseTeams(String responseBody) {
  final parsed = json.decode(responseBody);
  final List<dynamic> teamsJson = parsed['data'];
  return teamsJson.map((json) => NBATeam.fromJson(json)).toList();
}


