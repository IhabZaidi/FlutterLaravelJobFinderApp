import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:jobfinder/logic/model/SendAuth_model.dart';
import 'package:meta/meta.dart';

part 'authcubit_state.dart';

class AuthcubitCubit extends Cubit<AuthcubitState> {
  AuthcubitCubit() : super(AuthcubitInitial());
  String accessToken = '';
  String username = '';
  Map<String, dynamic> js = {};

  Future loginMethod({required String username,required String password}) async {
    emitWaiting();
    try {
      js =
          SendAuth(email: username, password: password).toJson();
      log(jsonEncode(js).length.toString());
      var responce = await http.post(
          Uri.parse('http://192.168.1.3:80/api/login'),
          body: jsonEncode(js),
          headers: headers);
      if (responce.statusCode == 201) {
        var tt = RespAuth.fromJson(jsonDecode(responce.body));
        accessToken = tt.token;
        username = tt.user.name;
        emitLoged();
      } else {
        emitFailed();
        log(responce.statusCode.toString());
      }
    } on Exception catch (error) {
      log(error.toString());
      emitFailed();
    }
  }

  Future registerMethod({required String name, required String mail, required String pass, required String passconfirmation}) async {
    emitWaiting();
    try {
      js = RegisterAuth(
              name: name,
              email: mail,
              password: pass,
              passwordConfirmation: passconfirmation)
          .toJson();
      var responce = await http.post(
          Uri.parse('http://192.168.1.3:80/api/register'),
          body: jsonEncode(js),
          headers: headers);
      if (responce.statusCode == 201) {
        var tt = RespAuth.fromJson(jsonDecode(responce.body));
        accessToken = tt.token;
        username = tt.user.name;
        log(accessToken);
        emitLoged();
      } else {
        emitFailed();
        log(responce.statusCode.toString());
      }
    } on Exception catch (error) {
      log(error.toString());
      emitFailed();
    }
  }

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Content-Length": jsonEncode(js).length.toString(),
        //"Authorization": "Bearer $_token",
      };

  void emitFailed() => emit(AuthcubitFailed());
  void emitWaiting() => emit(AuthcubitWaiting());
  void emitLoged() => emit(AuthcubitLoged());
  void emitLogout() => emit(AuthcubitLogout());
}
