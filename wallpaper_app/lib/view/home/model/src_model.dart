import 'package:json_annotation/json_annotation.dart';

part 'src_model.g.dart';

@JsonSerializable(createToJson: false)
class Src {
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  Src(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  @override
  factory Src.fromJson(Map<String, dynamic> json) {
    return _$SrcFromJson(json);
  }
}
