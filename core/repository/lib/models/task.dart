import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final String id;
  final String name;

  Task({
    required this.id,
    required this.name,
  });

//factory Business.fromJson(Map<String, dynamic> json) => _$BusinessFromJson(json);
//Map<String, dynamic> toJson() => _$BusinessToJson(this);
}
