// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RankingState {
  List<Post> get shapes => throw _privateConstructorUsedError;
  List<Post> get comedian => throw _privateConstructorUsedError;
  List<Post> get anime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RankingStateCopyWith<RankingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingStateCopyWith<$Res> {
  factory $RankingStateCopyWith(
          RankingState value, $Res Function(RankingState) then) =
      _$RankingStateCopyWithImpl<$Res, RankingState>;
  @useResult
  $Res call({List<Post> shapes, List<Post> comedian, List<Post> anime});
}

/// @nodoc
class _$RankingStateCopyWithImpl<$Res, $Val extends RankingState>
    implements $RankingStateCopyWith<$Res> {
  _$RankingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shapes = null,
    Object? comedian = null,
    Object? anime = null,
  }) {
    return _then(_value.copyWith(
      shapes: null == shapes
          ? _value.shapes
          : shapes // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      comedian: null == comedian
          ? _value.comedian
          : comedian // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingStateImplCopyWith<$Res>
    implements $RankingStateCopyWith<$Res> {
  factory _$$RankingStateImplCopyWith(
          _$RankingStateImpl value, $Res Function(_$RankingStateImpl) then) =
      __$$RankingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> shapes, List<Post> comedian, List<Post> anime});
}

/// @nodoc
class __$$RankingStateImplCopyWithImpl<$Res>
    extends _$RankingStateCopyWithImpl<$Res, _$RankingStateImpl>
    implements _$$RankingStateImplCopyWith<$Res> {
  __$$RankingStateImplCopyWithImpl(
      _$RankingStateImpl _value, $Res Function(_$RankingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shapes = null,
    Object? comedian = null,
    Object? anime = null,
  }) {
    return _then(_$RankingStateImpl(
      shapes: null == shapes
          ? _value._shapes
          : shapes // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      comedian: null == comedian
          ? _value._comedian
          : comedian // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      anime: null == anime
          ? _value._anime
          : anime // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$RankingStateImpl implements _RankingState {
  const _$RankingStateImpl(
      {required final List<Post> shapes,
      required final List<Post> comedian,
      required final List<Post> anime})
      : _shapes = shapes,
        _comedian = comedian,
        _anime = anime;

  final List<Post> _shapes;
  @override
  List<Post> get shapes {
    if (_shapes is EqualUnmodifiableListView) return _shapes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shapes);
  }

  final List<Post> _comedian;
  @override
  List<Post> get comedian {
    if (_comedian is EqualUnmodifiableListView) return _comedian;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comedian);
  }

  final List<Post> _anime;
  @override
  List<Post> get anime {
    if (_anime is EqualUnmodifiableListView) return _anime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anime);
  }

  @override
  String toString() {
    return 'RankingState(shapes: $shapes, comedian: $comedian, anime: $anime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingStateImpl &&
            const DeepCollectionEquality().equals(other._shapes, _shapes) &&
            const DeepCollectionEquality().equals(other._comedian, _comedian) &&
            const DeepCollectionEquality().equals(other._anime, _anime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_shapes),
      const DeepCollectionEquality().hash(_comedian),
      const DeepCollectionEquality().hash(_anime));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingStateImplCopyWith<_$RankingStateImpl> get copyWith =>
      __$$RankingStateImplCopyWithImpl<_$RankingStateImpl>(this, _$identity);
}

abstract class _RankingState implements RankingState {
  const factory _RankingState(
      {required final List<Post> shapes,
      required final List<Post> comedian,
      required final List<Post> anime}) = _$RankingStateImpl;

  @override
  List<Post> get shapes;
  @override
  List<Post> get comedian;
  @override
  List<Post> get anime;
  @override
  @JsonKey(ignore: true)
  _$$RankingStateImplCopyWith<_$RankingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
