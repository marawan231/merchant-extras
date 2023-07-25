import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NotifiticationModel {
  int? id;
  String? content;
  @JsonKey(name: 'is_read')
  int? isRead;
  @JsonKey(name: 'created_at',fromJson: _dateTimeFromJson)
  DateTime? createdAt;

  NotifiticationModel({this.id, this.content, this.isRead, this.createdAt});

  factory NotifiticationModel.fromJson(Map<String, dynamic> json) =>
      _$NotifiticationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotifiticationModelToJson(this);

  static DateTime _dateTimeFromJson(String value) {
    return DateTime.parse(value);
  }
}
