// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) {
  return _NoteModel.fromJson(json);
}

/// @nodoc
mixin _$NoteModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;

  /// Serializes this NoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteModelCopyWith<NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModelCopyWith<$Res> {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) then) =
      _$NoteModelCopyWithImpl<$Res, NoteModel>;
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    String image,
    String createAt,
    String updateAt,
    String tag,
  });
}

/// @nodoc
class _$NoteModelCopyWithImpl<$Res, $Val extends NoteModel>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? image = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? tag = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            createAt:
                null == createAt
                    ? _value.createAt
                    : createAt // ignore: cast_nullable_to_non_nullable
                        as String,
            updateAt:
                null == updateAt
                    ? _value.updateAt
                    : updateAt // ignore: cast_nullable_to_non_nullable
                        as String,
            tag:
                null == tag
                    ? _value.tag
                    : tag // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NoteModelImplCopyWith<$Res>
    implements $NoteModelCopyWith<$Res> {
  factory _$$NoteModelImplCopyWith(
    _$NoteModelImpl value,
    $Res Function(_$NoteModelImpl) then,
  ) = __$$NoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    String image,
    String createAt,
    String updateAt,
    String tag,
  });
}

/// @nodoc
class __$$NoteModelImplCopyWithImpl<$Res>
    extends _$NoteModelCopyWithImpl<$Res, _$NoteModelImpl>
    implements _$$NoteModelImplCopyWith<$Res> {
  __$$NoteModelImplCopyWithImpl(
    _$NoteModelImpl _value,
    $Res Function(_$NoteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? image = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? tag = null,
  }) {
    return _then(
      _$NoteModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        createAt:
            null == createAt
                ? _value.createAt
                : createAt // ignore: cast_nullable_to_non_nullable
                    as String,
        updateAt:
            null == updateAt
                ? _value.updateAt
                : updateAt // ignore: cast_nullable_to_non_nullable
                    as String,
        tag:
            null == tag
                ? _value.tag
                : tag // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteModelImpl implements _NoteModel {
  const _$NoteModelImpl({
    this.id = 0,
    this.title = '',
    this.content = '',
    this.image = '',
    this.createAt = '',
    this.updateAt = '',
    this.tag = '',
  });

  factory _$NoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String createAt;
  @override
  @JsonKey()
  final String updateAt;
  @override
  @JsonKey()
  final String tag;

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, content: $content, image: $image, createAt: $createAt, updateAt: $updateAt, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    content,
    image,
    createAt,
    updateAt,
    tag,
  );

  /// Create a copy of NoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      __$$NoteModelImplCopyWithImpl<_$NoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteModelImplToJson(this);
  }
}

abstract class _NoteModel implements NoteModel {
  const factory _NoteModel({
    final int id,
    final String title,
    final String content,
    final String image,
    final String createAt,
    final String updateAt,
    final String tag,
  }) = _$NoteModelImpl;

  factory _NoteModel.fromJson(Map<String, dynamic> json) =
      _$NoteModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get image;
  @override
  String get createAt;
  @override
  String get updateAt;
  @override
  String get tag;

  /// Create a copy of NoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
