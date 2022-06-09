import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  String? email;
  String? address;
  String? phone;
  String? username;
  String? password;
  String? country;

  User({
    this.id,
    this.email,
    this.address,
    this.phone,
    this.username,
    this.password,
    this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
