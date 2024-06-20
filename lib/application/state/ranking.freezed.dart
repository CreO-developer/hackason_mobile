// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Ranking {
  List<Post> get shapes => throw _privateConstructorUsedError;
  List<Post> get comedian => throw _privateConstructorUsedError;
  List<Post> get anime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RankingCopyWith<Ranking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingCopyWith<$Res> {
  factory $RankingCopyWith(Ranking value, $Res Function(Ranking) then) =
      _$RankingCopyWithImpl<$Res, Ranking>;
  @useResult
  $Res call({List<Post> shapes, List<Post> comedian, List<Post> anime});
}

/// @nodoc
class _$RankingCopyWithImpl<$Res, $Val extends Ranking>
    implements $RankingCopyWith<$Res> {
  _$RankingCopyWithImpl(this._value, this._then);

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
abstract class _$$RankingImplCopyWith<$Res> implements $RankingCopyWith<$Res> {
  factory _$$RankingImplCopyWith(
          _$RankingImpl value, $Res Function(_$RankingImpl) then) =
      __$$RankingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> shapes, List<Post> comedian, List<Post> anime});
}

/// @nodoc
class __$$RankingImplCopyWithImpl<$Res>
    extends _$RankingCopyWithImpl<$Res, _$RankingImpl>
    implements _$$RankingImplCopyWith<$Res> {
  __$$RankingImplCopyWithImpl(
      _$RankingImpl _value, $Res Function(_$RankingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shapes = null,
    Object? comedian = null,
    Object? anime = null,
  }) {
    return _then(_$RankingImpl(
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

class _$RankingImpl implements _Ranking {
  const _$RankingImpl(
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
    return 'Ranking(shapes: $shapes, comedian: $comedian, anime: $anime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingImpl &&
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
  _$$RankingImplCopyWith<_$RankingImpl> get copyWith =>
      __$$RankingImplCopyWithImpl<_$RankingImpl>(this, _$identity);
}

abstract class _Ranking implements Ranking {
  const factory _Ranking(
      {required final List<Post> shapes,
      required final List<Post> comedian,
      required final List<Post> anime}) = _$RankingImpl;

  @override
  List<Post> get shapes;
  @override
  List<Post> get comedian;
  @override
  List<Post> get anime;
  @override
  @JsonKey(ignore: true)
  _$$RankingImplCopyWith<_$RankingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
