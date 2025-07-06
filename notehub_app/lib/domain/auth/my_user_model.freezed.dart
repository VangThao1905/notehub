// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MyUserModel _$MyUserModelFromJson(Map<String, dynamic> json) {
  return _MyUserModel.fromJson(json);
}

/// @nodoc
mixin _$MyUserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  /// Serializes this MyUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyUserModelCopyWith<MyUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUserModelCopyWith<$Res> {
  factory $MyUserModelCopyWith(
    MyUserModel value,
    $Res Function(MyUserModel) then,
  ) = _$MyUserModelCopyWithImpl<$Res, MyUserModel>;
  @useResult
  $Res call({String id, String email, String username, String avatar});
}

/// @nodoc
class _$MyUserModelCopyWithImpl<$Res, $Val extends MyUserModel>
    implements $MyUserModelCopyWith<$Res> {
  _$MyUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            username:
                null == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String,
            avatar:
                null == avatar
                    ? _value.avatar
                    : avatar // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyUserModelImplCopyWith<$Res>
    implements $MyUserModelCopyWith<$Res> {
  factory _$$MyUserModelImplCopyWith(
    _$MyUserModelImpl value,
    $Res Function(_$MyUserModelImpl) then,
  ) = __$$MyUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String username, String avatar});
}

/// @nodoc
class __$$MyUserModelImplCopyWithImpl<$Res>
    extends _$MyUserModelCopyWithImpl<$Res, _$MyUserModelImpl>
    implements _$$MyUserModelImplCopyWith<$Res> {
  __$$MyUserModelImplCopyWithImpl(
    _$MyUserModelImpl _value,
    $Res Function(_$MyUserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(
      _$MyUserModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String,
        avatar:
            null == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MyUserModelImpl implements _MyUserModel {
  const _$MyUserModelImpl({
    this.id = '',
    this.email = '',
    this.username = '',
    this.avatar = '',
  });

  factory _$MyUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyUserModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String avatar;

  @override
  String toString() {
    return 'MyUserModel(id: $id, email: $email, username: $username, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, username, avatar);

  /// Create a copy of MyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUserModelImplCopyWith<_$MyUserModelImpl> get copyWith =>
      __$$MyUserModelImplCopyWithImpl<_$MyUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyUserModelImplToJson(this);
  }
}

abstract class _MyUserModel implements MyUserModel {
  const factory _MyUserModel({
    final String id,
    final String email,
    final String username,
    final String avatar,
  }) = _$MyUserModelImpl;

  factory _MyUserModel.fromJson(Map<String, dynamic> json) =
      _$MyUserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get username;
  @override
  String get avatar;

  /// Create a copy of MyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyUserModelImplCopyWith<_$MyUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
