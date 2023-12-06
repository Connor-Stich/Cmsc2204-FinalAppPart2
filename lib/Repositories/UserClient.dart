import 'package:dio/dio.dart';
import 'package:stich_finalappproject/Repositories/DataService.dart';

const String BaseUrl = "https://www.balldontlie.io/api/v1";

class UserClient {
  final _dio = Dio(BaseOptions(baseUrl: BaseUrl));

  DataService _dataService = DataService();

}