// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResults _$ApiResultsFromJson(Map<String, dynamic> json) => ApiResults(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ApiResultsToJson(ApiResults instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
