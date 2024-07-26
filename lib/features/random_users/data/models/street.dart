import 'package:json_annotation/json_annotation.dart';

part 'street.g.dart';

@JsonSerializable()
class Street {
  const Street({required this.number, required this.name});

  @JsonKey(name: 'number', defaultValue: 0)
  final int? number;
  @JsonKey(name: 'name', defaultValue: '')
  final String? name;

  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);

  Map<String, dynamic> toJson() => _$StreetToJson(this);
}
