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
  int get includeScore => throw _privateConstructorUsedError;
  int get excludeScore => throw _privateConstructorUsedError;
  int get peopleScore => throw _privateConstructorUsedError;
  int get originalScore => throw _privateConstructorUsedError;
  int? get faceScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoresCopyWith<Scores> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoresCopyWith<$Res> {
  factory $ScoresCopyWith(Scores value, $Res Function(Scores) then) =
      _$ScoresCopyWithImpl<$Res, Scores>;
  @useResult
  $Res call(
      {int includeScore,
      int excludeScore,
      int peopleScore,
      int originalScore,
      int? faceScore});
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
    Object? includeScore = null,
    Object? excludeScore = null,
    Object? peopleScore = null,
    Object? originalScore = null,
    Object? faceScore = freezed,
  }) {
    return _then(_value.copyWith(
      includeScore: null == includeScore
          ? _value.includeScore
          : includeScore // ignore: cast_nullable_to_non_nullable
              as int,
      excludeScore: null == excludeScore
          ? _value.excludeScore
          : excludeScore // ignore: cast_nullable_to_non_nullable
              as int,
      peopleScore: null == peopleScore
          ? _value.peopleScore
          : peopleScore // ignore: cast_nullable_to_non_nullable
              as int,
      originalScore: null == originalScore
          ? _value.originalScore
          : originalScore // ignore: cast_nullable_to_non_nullable
              as int,
      faceScore: freezed == faceScore
          ? _value.faceScore
          : faceScore // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {int includeScore,
      int excludeScore,
      int peopleScore,
      int originalScore,
      int? faceScore});
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
    Object? includeScore = null,
    Object? excludeScore = null,
    Object? peopleScore = null,
    Object? originalScore = null,
    Object? faceScore = freezed,
  }) {
    return _then(_$ScoresImpl(
      includeScore: null == includeScore
          ? _value.includeScore
          : includeScore // ignore: cast_nullable_to_non_nullable
              as int,
      excludeScore: null == excludeScore
          ? _value.excludeScore
          : excludeScore // ignore: cast_nullable_to_non_nullable
              as int,
      peopleScore: null == peopleScore
          ? _value.peopleScore
          : peopleScore // ignore: cast_nullable_to_non_nullable
              as int,
      originalScore: null == originalScore
          ? _value.originalScore
          : originalScore // ignore: cast_nullable_to_non_nullable
              as int,
      faceScore: freezed == faceScore
          ? _value.faceScore
          : faceScore // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoresImpl implements _Scores {
  const _$ScoresImpl(
      {required this.includeScore,
      required this.excludeScore,
      required this.peopleScore,
      required this.originalScore,
      this.faceScore});

  factory _$ScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoresImplFromJson(json);

  @override
  final int includeScore;
  @override
  final int excludeScore;
  @override
  final int peopleScore;
  @override
  final int originalScore;
  @override
  final int? faceScore;

  @override
  String toString() {
    return 'Scores(includeScore: $includeScore, excludeScore: $excludeScore, peopleScore: $peopleScore, originalScore: $originalScore, faceScore: $faceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoresImpl &&
            (identical(other.includeScore, includeScore) ||
                other.includeScore == includeScore) &&
            (identical(other.excludeScore, excludeScore) ||
                other.excludeScore == excludeScore) &&
            (identical(other.peopleScore, peopleScore) ||
                other.peopleScore == peopleScore) &&
            (identical(other.originalScore, originalScore) ||
                other.originalScore == originalScore) &&
            (identical(other.faceScore, faceScore) ||
                other.faceScore == faceScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, includeScore, excludeScore,
      peopleScore, originalScore, faceScore);

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
      {required final int includeScore,
      required final int excludeScore,
      required final int peopleScore,
      required final int originalScore,
      final int? faceScore}) = _$ScoresImpl;

  factory _Scores.fromJson(Map<String, dynamic> json) = _$ScoresImpl.fromJson;

  @override
  int get includeScore;
  @override
  int get excludeScore;
  @override
  int get peopleScore;
  @override
  int get originalScore;
  @override
  int? get faceScore;
  @override
  @JsonKey(ignore: true)
  _$$ScoresImplCopyWith<_$ScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
