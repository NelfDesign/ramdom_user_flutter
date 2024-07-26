import 'package:json_annotation/json_annotation.dart';
import 'package:randomuserflutter/features/random_users/data/models/location.dart';
import 'package:randomuserflutter/features/random_users/data/models/name.dart';
import 'package:randomuserflutter/features/random_users/data/models/picture.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.gender,
    required this.email,
    required this.location,
    required this.phone,
    required this.picture,
    required this.name,
    required this.nat,
  });

  @JsonKey(name: 'gender', defaultValue: '')
  final String gender;
  @JsonKey(name: 'name', defaultValue: null)
  final Name? name;
  @JsonKey(name: 'location', defaultValue: null)
  final Location? location;
  @JsonKey(name: 'email', defaultValue: '')
  final String? email;
  @JsonKey(name: 'phone', defaultValue: '')
  final String? phone;
  @JsonKey(name: 'picture', defaultValue: null)
  final Picture? picture;
  @JsonKey(name: 'nat', defaultValue: '')
  final String nat;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
