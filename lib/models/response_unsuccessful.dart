import 'dart:convert';

ResponseUnsuccess responseUnsuccessFromJson(String str) =>
    ResponseUnsuccess.fromJson(json.decode(str));

String responseUnsuccessToJson(ResponseUnsuccess data) =>
    json.encode(data.toJson());

class ResponseUnsuccess {
  String message;

  ResponseUnsuccess({this.message});

  factory ResponseUnsuccess.fromJson(Map<String, dynamic> json) =>
      ResponseUnsuccess(message: json["message"]);
  Map<String, dynamic> toJson() => {"message": message};
}
