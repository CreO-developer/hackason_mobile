// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserScoresState {
  String get imgUrl => throw _privateConstructorUsedError;
  String get filter => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  Scores get scores => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserScoresStateCopyWith<UserScoresState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScoresStateCopyWith<$Res> {
  factory $UserScoresStateCopyWith(
          UserScoresState value, $Res Function(UserScoresState) then) =
      _$UserScoresStateCopyWithImpl<$Res, UserScoresState>;
  @useResult
  $Res call({String imgUrl, String filter, String theme, Scores scores});

  $ScoresCopyWith<$Res> get scores;
}

/// @nodoc
class _$UserScoresStateCopyWithImpl<$Res, $Val extends UserScoresState>
    implements $UserScoresStateCopyWith<$Res> {
  _$UserScoresStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? filter = null,
    Object? theme = null,
    Object? scores = null,
  }) {
    return _then(_value.copyWith(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Scores,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScoresCopyWith<$Res> get scores {
    return $ScoresCopyWith<$Res>(_value.scores, (value) {
      return _then(_value.copyWith(scores: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserScoresStateImplCopyWith<$Res>
    implements $UserScoresStateCopyWith<$Res> {
  factory _$$UserScoresStateImplCopyWith(_$UserScoresStateImpl value,
          $Res Function(_$UserScoresStateImpl) then) =
      __$$UserScoresStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imgUrl, String filter, String theme, Scores scores});

  @override
  $ScoresCopyWith<$Res> get scores;
}

/// @nodoc
class __$$UserScoresStateImplCopyWithImpl<$Res>
    extends _$UserScoresStateCopyWithImpl<$Res, _$UserScoresStateImpl>
    implements _$$UserScoresStateImplCopyWith<$Res> {
  __$$UserScoresStateImplCopyWithImpl(
      _$UserScoresStateImpl _value, $Res Function(_$UserScoresStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? filter = null,
    Object? theme = null,
    Object? scores = null,
  }) {
    return _then(_$UserScoresStateImpl(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Scores,
    ));
  }
}

/// @nodoc

class _$UserScoresStateImpl implements _UserScoresState {
  const _$UserScoresStateImpl(
      {required this.imgUrl,
      required this.filter,
      required this.theme,
      required this.scores});

  @override
  final String imgUrl;
  @override
  final String filter;
  @override
  final String theme;
  @override
  final Scores scores;

  @override
  String toString() {
    return 'UserScoresState(imgUrl: $imgUrl, filter: $filter, theme: $theme, scores: $scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserScoresStateImpl &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.scores, scores) || other.scores == scores));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imgUrl, filter, theme, scores);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserScoresStateImplCopyWith<_$UserScoresStateImpl> get copyWith =>
      __$$UserScoresStateImplCopyWithImpl<_$UserScoresStateImpl>(
          this, _$identity);
}

abstract class _UserScoresState implements UserScoresState {
  const factory _UserScoresState(
      {required final String imgUrl,
      required final String filter,
      required final String theme,
      required final Scores scores}) = _$UserScoresStateImpl;

  @override
  String get imgUrl;
  @override
  String get filter;
  @override
  String get theme;
  @override
  Scores get scores;
  @override
  @JsonKey(ignore: true)
  _$$UserScoresStateImplCopyWith<_$UserScoresStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
