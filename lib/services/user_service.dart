import 'package:dio/dio.dart';
import 'package:mechinetest/models/user_model.dart';

class UserService{
  final _dio = Dio();
  final _url = "https://jsonplaceholder.typicode.com/users";
  Future<List<UserModel>> getUsers()async{
    try {
      final response =await  _dio.get(_url);
      if(response.statusCode==200){
        List<UserModel>  users = (response.data as List<dynamic>).map((e) => UserModel.fromJson(e)).toList();

        return users;
        
      }
      return [];
    } on Exception catch (e) {

      print(e);
      return [];
    }
    

  }
}