import 'package:schedule_app/imports.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static String token = Get.find<AuthController>().token.value;
  static var client = http.Client();
  static String host = 'http://127.0.0.1:3000';

  static Future<String> login(String userName, String password) async {
    var url = Uri.parse("${host}/users/login");
    var respone = await client.post(
      url,
      body: {'userName': userName, 'password': password},
    );
    if (respone.statusCode == 200) {
      print("login success");
      var jsonString = respone.body;
      print(jsonString);
      return jsonString;
    } else {
      return null;
    }
  }

  static Future<String> register(String userName, String password) async {
    var url = Uri.parse("$host/users/register");
    var response = await client.post(
      url,
      body: {'userName': userName, 'password': password},
    );
    if (response.statusCode == 200) {
      print("register success");
      return "register success";
    } else if (response.statusCode == 203 || response.statusCode == 202) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String> createNewProfile(
      String userId, List<Profile> profiles, String newProfileName) async {
    var url = Uri.parse("$host/users/createNewProfile");
    var response = await client.post(
      url,
      headers: {'auth-token': token},
      body: {
        'userId': userId,
        'profiles': json.encode(profiles),
        'newProfileName': newProfileName,
      },
    );
    if (response.statusCode == 200) {
      print("update user sucessfully");
      return "update user sucessfully";
    } else {
      return null;
    }
  }

  static Future<User> getInfoByToken(String token) async {
    var url = Uri.parse("${host}/users/token");
    var respone = await client.get(
      url,
      headers: {'auth-token': token},
    );
    if (respone.statusCode == 200) {
      print("get info success");
      var jsonString = respone.body;
      print(jsonString);
      return userFromJson(jsonString);
    } else {
      print("get Info by token failed");
      return null;
    }
  }

  static Future<String> updateEventList(dynamic data) async {
    var url = Uri.parse("${host}/events/updateEventList");
    var respone =
        await client.post(url, headers: {'auth-token': token}, body: data);
    if (respone.statusCode == 200) {
      print("add event successfully");
      var jsonString = respone.body;
      print(jsonString);
      return jsonString;
    } else {
      print("add event failed");
      return null;
    }
  }

  static Future<List<Event>> getEventListByProfileName(
      {String id, String name}) async {
    var url = Uri.parse("$host/events/getByProfileName");
    var respone = await client.post(
      url,
      headers: {'auth-token': token},
      body: {
        "userId": id,
        "profileName": name,
      },
    );

    if (respone.statusCode == 200) {
      print("get eventList by profileName successfully");
      var jsonString = respone.body;
      print(eventListFromJson(jsonString));
      return eventListFromJson(jsonString);
    } else {
      print("get eventList by profileName failed");
      return null;
    }
  }
}
