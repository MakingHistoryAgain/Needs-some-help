import 'package:json_annotation/json_annotation.dart';
part 'zournal.g.dart';

@JsonSerializable()
class JournalList {
  final String name;
  final String impact;
  final String number;

  JournalList(this.name, this.impact, this.number);

  factory JournalList.fromJson(Map<String, dynamic> json) =>
      _$JournalListFromJson(json);

  Map<String, dynamic> toJson() => _$JournalListToJson(this);
}
