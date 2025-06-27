// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteModelImpl _$$NoteModelImplFromJson(Map<String, dynamic> json) =>
    _$NoteModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      image: json['image'] as String? ?? '',
      createAt: json['createAt'] as String? ?? '',
      updateAt: json['updateAt'] as String? ?? '',
      tag: json['tag'] as String? ?? '',
    );

Map<String, dynamic> _$$NoteModelImplToJson(_$NoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'tag': instance.tag,
    };
