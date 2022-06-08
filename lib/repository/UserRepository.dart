import 'package:batch28_api_starter/api/RegisterUser.dart';
import 'package:batch28_api_starter/model/UserModel.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> loginUser(User user) async {
    return await UserApi().loginUser(user);
  }
}
