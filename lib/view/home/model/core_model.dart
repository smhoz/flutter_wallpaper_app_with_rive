import 'package:json_annotation/json_annotation.dart';

import 'photo_model.dart';

part 'core_model.g.dart';

@JsonSerializable(createToJson: false)
class Core {
  int? page;
  int? perPage;
  List<Photo>? photos;
  Core({
    this.page,
    this.perPage,
    this.photos,
  });

  factory Core.fromJson(Map<String, dynamic> json) {
    return _$CoreFromJson(json);
  }
}
