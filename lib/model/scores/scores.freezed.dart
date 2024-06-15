// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scores.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Scores _$ScoresFromJson(Map<String, dynamic> json) {
  return _Scores.fromJson(json);
}

/// @nodoc
mixin _$Scores {
  int get score1 => throw _privateConstructorUsedError;
  int get score2 => throw _privateConstructorUsedError;
  int get score3 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoresCopyWith<Scores> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoresCopyWith<$Res> {
  factory $ScoresCopyWith(Scores value, $Res Function(Scores) then) =
      _$ScoresCopyWithImpl<$Res, Scores>;
  @useResult
  $Res call({int score1, int score2, int score3});
}

/// @nodoc
class _$ScoresCopyWithImpl<$Res, $Val extends Scores>
    implements $ScoresCopyWith<$Res> {
  _$ScoresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score1 = null,
    Object? score2 = null,
    Object? score3 = null,
  }) {
    return _then(_value.copyWith(
      score1: null == score1
          ? _value.score1
          : score1 // ignore: cast_nullable_to_non_nullable
              as int,
      score2: null == score2
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as int,
      score3: null == score3
          ? _value.score3
          : score3 // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoresImplCopyWith<$Res> implements $ScoresCopyWith<$Res> {
  factory _$$ScoresImplCopyWith(
          _$ScoresImpl value, $Res Function(_$ScoresImpl) then) =
      __$$ScoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int score1, int score2, int score3});
}

/// @nodoc
class __$$ScoresImplCopyWithImpl<$Res>
    extends _$ScoresCopyWithImpl<$Res, _$ScoresImpl>
    implements _$$ScoresImplCopyWith<$Res> {
  __$$ScoresImplCopyWithImpl(
      _$ScoresImpl _value, $Res Function(_$ScoresImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score1 = null,
    Object? score2 = null,
    Object? score3 = null,
  }) {
    return _then(_$ScoresImpl(
      score1: null == score1
          ? _value.score1
          : score1 // ignore: cast_nullable_to_non_nullable
              as int,
      score2: null == score2
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as int,
      score3: null == score3
          ? _value.score3
          : score3 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoresImpl implements _Scores {
  const _$ScoresImpl(
      {required this.score1, required this.score2, required this.score3});

  factory _$ScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoresImplFromJson(json);

  @override
  final int score1;
  @override
  final int score2;
  @override
  final int score3;

  @override
  String toString() {
    return 'Scores(score1: $score1, score2: $score2, score3: $score3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoresImpl &&
            (identical(other.score1, score1) || other.score1 == score1) &&
            (identical(other.score2, score2) || other.score2 == score2) &&
            (identical(other.score3, score3) || other.score3 == score3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, score1, score2, score3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoresImplCopyWith<_$ScoresImpl> get copyWith =>
      __$$ScoresImplCopyWithImpl<_$ScoresImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoresImplToJson(
      this,
    );
  }
}

abstract class _Scores implements Scores {
  const factory _Scores(
      {required final int score1,
      required final int score2,
      required final int score3}) = _$ScoresImpl;

  factory _Scores.fromJson(Map<String, dynamic> json) = _$ScoresImpl.fromJson;

  @override
  int get score1;
  @override
  int get score2;
  @override
  int get score3;
  @override
  @JsonKey(ignore: true)
  _$$ScoresImplCopyWith<_$ScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
