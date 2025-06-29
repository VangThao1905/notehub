// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_modify_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NoteModifyState {
  bool get isShowLoading => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get selectedTag => throw _privateConstructorUsedError;

  /// Create a copy of NoteModifyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteModifyStateCopyWith<NoteModifyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModifyStateCopyWith<$Res> {
  factory $NoteModifyStateCopyWith(
    NoteModifyState value,
    $Res Function(NoteModifyState) then,
  ) = _$NoteModifyStateCopyWithImpl<$Res, NoteModifyState>;
  @useResult
  $Res call({
    bool isShowLoading,
    String imagePath,
    List<String> tags,
    String selectedTag,
  });
}

/// @nodoc
class _$NoteModifyStateCopyWithImpl<$Res, $Val extends NoteModifyState>
    implements $NoteModifyStateCopyWith<$Res> {
  _$NoteModifyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteModifyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowLoading = null,
    Object? imagePath = null,
    Object? tags = null,
    Object? selectedTag = null,
  }) {
    return _then(
      _value.copyWith(
            isShowLoading:
                null == isShowLoading
                    ? _value.isShowLoading
                    : isShowLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            imagePath:
                null == imagePath
                    ? _value.imagePath
                    : imagePath // ignore: cast_nullable_to_non_nullable
                        as String,
            tags:
                null == tags
                    ? _value.tags
                    : tags // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            selectedTag:
                null == selectedTag
                    ? _value.selectedTag
                    : selectedTag // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NoteModifyStateImplCopyWith<$Res>
    implements $NoteModifyStateCopyWith<$Res> {
  factory _$$NoteModifyStateImplCopyWith(
    _$NoteModifyStateImpl value,
    $Res Function(_$NoteModifyStateImpl) then,
  ) = __$$NoteModifyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isShowLoading,
    String imagePath,
    List<String> tags,
    String selectedTag,
  });
}

/// @nodoc
class __$$NoteModifyStateImplCopyWithImpl<$Res>
    extends _$NoteModifyStateCopyWithImpl<$Res, _$NoteModifyStateImpl>
    implements _$$NoteModifyStateImplCopyWith<$Res> {
  __$$NoteModifyStateImplCopyWithImpl(
    _$NoteModifyStateImpl _value,
    $Res Function(_$NoteModifyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NoteModifyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowLoading = null,
    Object? imagePath = null,
    Object? tags = null,
    Object? selectedTag = null,
  }) {
    return _then(
      _$NoteModifyStateImpl(
        isShowLoading:
            null == isShowLoading
                ? _value.isShowLoading
                : isShowLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        imagePath:
            null == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                    as String,
        tags:
            null == tags
                ? _value._tags
                : tags // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        selectedTag:
            null == selectedTag
                ? _value.selectedTag
                : selectedTag // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$NoteModifyStateImpl implements _NoteModifyState {
  const _$NoteModifyStateImpl({
    this.isShowLoading = false,
    this.imagePath = '',
    final List<String> tags = const [],
    this.selectedTag = '',
  }) : _tags = tags;

  @override
  @JsonKey()
  final bool isShowLoading;
  @override
  @JsonKey()
  final String imagePath;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final String selectedTag;

  @override
  String toString() {
    return 'NoteModifyState(isShowLoading: $isShowLoading, imagePath: $imagePath, tags: $tags, selectedTag: $selectedTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteModifyStateImpl &&
            (identical(other.isShowLoading, isShowLoading) ||
                other.isShowLoading == isShowLoading) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.selectedTag, selectedTag) ||
                other.selectedTag == selectedTag));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isShowLoading,
    imagePath,
    const DeepCollectionEquality().hash(_tags),
    selectedTag,
  );

  /// Create a copy of NoteModifyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteModifyStateImplCopyWith<_$NoteModifyStateImpl> get copyWith =>
      __$$NoteModifyStateImplCopyWithImpl<_$NoteModifyStateImpl>(
        this,
        _$identity,
      );
}

abstract class _NoteModifyState implements NoteModifyState {
  const factory _NoteModifyState({
    final bool isShowLoading,
    final String imagePath,
    final List<String> tags,
    final String selectedTag,
  }) = _$NoteModifyStateImpl;

  @override
  bool get isShowLoading;
  @override
  String get imagePath;
  @override
  List<String> get tags;
  @override
  String get selectedTag;

  /// Create a copy of NoteModifyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteModifyStateImplCopyWith<_$NoteModifyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
