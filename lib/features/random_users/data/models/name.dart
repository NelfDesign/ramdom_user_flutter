import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

@JsonSerializable()
class Name {
  const Name({required this.last, required this.first});
  @JsonKey(name: 'first', defaultValue: '')
  final String? first;
  @JsonKey(name: 'last', defaultValue: '')
  final String? last;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
