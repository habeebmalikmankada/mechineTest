import 'package:flutter/cupertino.dart';
import 'package:mechinetest/services/user_service.dart';

import '../models/user_model.dart';

class UserController extends ChangeNotifier {
List<UserModel> users = [];
List<UserModel> staredList = [];

final userService = UserService();
void getUsers()async{
  final _users = await userService.getUsers();
  users = _users;
  notifyListeners();

}

void star(UserModel user){
  if(staredList.contains(user)){
    staredList.remove(user);
    notifyListeners();
    return;
  }
  staredList.add(user);
  notifyListeners();

}


bool isStared(UserModel user){
  final list = staredList.where((element) => user.id==element.id).toList();
  return list.isNotEmpty;
}


}