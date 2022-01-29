// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Core _$CoreFromJson(Map<String, dynamic> json) => Core(
      page: json['page'] as int?,
      perPage: json['perPage'] as int?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
