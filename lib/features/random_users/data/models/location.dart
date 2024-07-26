import 'package:json_annotation/json_annotation.dart';
import 'package:randomuserflutter/features/random_users/data/models/street.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  const Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  @JsonKey(name: 'street', defaultValue: null)
  final Street? street;
  @JsonKey(name: 'city', defaultValue: '')
  final String? city;
  @JsonKey(name: 'state', defaultValue: '')
  final String? state;
  @JsonKey(name: 'country', defaultValue: '')
  final String? country;
  @JsonKey(name: 'postcode', defaultValue: '')
  final String? postcode;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}