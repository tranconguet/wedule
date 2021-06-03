import 'package:schedule_app/imports.dart';

User userFromJson(String str) => User.fromJson(json.decode(str)[0]);

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.userName,
    this.profiles,
  });

  String id;
  String userName;
  List<Profile> profiles;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        userName: json["userName"],
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userName": userName,
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
      };
}

class Profile {
  Profile({
    this.profileName,
    this.lastAccess,
  });

  String profileName;
  String lastAccess;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        profileName: json["profileName"],
        lastAccess: json["lastAccess"],
      );

  Map<String, dynamic> toJson() => {
        "profileName": profileName,
        "lastAccess": lastAccess,
      };
}
