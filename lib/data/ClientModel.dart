import 'dart:convert';

class Client {
  int id;
  String firstName;
  String lastName;
  bool blocked;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.blocked,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        blocked: json["blocked"],
      );

  Client clientFromJson(String str) {
    final jsonData = json.decode(str);
    return Client.fromJson(jsonData);
  }

  String clientToJson(Client data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "blocked": blocked,
      };
}
