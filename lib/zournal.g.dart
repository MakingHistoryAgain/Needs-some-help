// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zournal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalList _$JournalListFromJson(Map<String, dynamic> json) {
  return JournalList(
    json['name'] as String,
    json['impact'] as String,
    json['number'] as String,
  );
}

Map<String, dynamic> _$JournalListToJson(JournalList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'impact': instance.impact,
      'number': instance.number,
    };
