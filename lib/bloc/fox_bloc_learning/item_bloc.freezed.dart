// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ItemEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() read,
    required TResult Function(String value) update,
    required TResult Function() delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? read,
    TResult? Function(String value)? update,
    TResult? Function()? delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? read,
    TResult Function(String value)? update,
    TResult Function()? delete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateItemEvent value) create,
    required TResult Function(_ReadItemEvent value) read,
    required TResult Function(_UpdateItemEvent value) update,
    required TResult Function(_DeleteItemEvent value) delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateItemEvent value)? create,
    TResult? Function(_ReadItemEvent value)? read,
    TResult? Function(_UpdateItemEvent value)? update,
    TResult? Function(_DeleteItemEvent value)? delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateItemEvent value)? create,
    TResult Function(_ReadItemEvent value)? read,
    TResult Function(_UpdateItemEvent value)? update,
    TResult Function(_DeleteItemEvent value)? delete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEventCopyWith<$Res> {
  factory $ItemEventCopyWith(ItemEvent value, $Res Function(ItemEvent) then) =
      _$ItemEventCopyWithImpl<$Res, ItemEvent>;
}

/// @nodoc
class _$ItemEventCopyWithImpl<$Res, $Val extends ItemEvent> implements $ItemEventCopyWith<$Res> {
  _$ItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateItemEventImplCopyWith<$Res> {
  factory _$$CreateItemEventImplCopyWith(
    _$CreateItemEventImpl value,
    $Res Function(_$CreateItemEventImpl) then,
  ) = __$$CreateItemEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateItemEventImplCopyWithImpl<$Res>
    extends _$ItemEventCopyWithImpl<$Res, _$CreateItemEventImpl>
    implements _$$CreateItemEventImplCopyWith<$Res> {
  __$$CreateItemEventImplCopyWithImpl(
    _$CreateItemEventImpl _value,
    $Res Function(_$CreateItemEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateItemEventImpl implements _CreateItemEvent {
  const _$CreateItemEventImpl();

  @override
  String toString() {
    return 'ItemEvent.create()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateItemEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() read,
    required TResult Function(String value) update,
    required TResult Function() delete,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? read,
    TResult? Function(String value)? update,
    TResult? Function()? delete,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? read,
    TResult Function(String value)? update,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateItemEvent value) create,
    required TResult Function(_ReadItemEvent value) read,
    required TResult Function(_UpdateItemEvent value) update,
    required TResult Function(_DeleteItemEvent value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateItemEvent value)? create,
    TResult? Function(_ReadItemEvent value)? read,
    TResult? Function(_UpdateItemEvent value)? update,
    TResult? Function(_DeleteItemEvent value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateItemEvent value)? create,
    TResult Function(_ReadItemEvent value)? read,
    TResult Function(_UpdateItemEvent value)? update,
    TResult Function(_DeleteItemEvent value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _CreateItemEvent implements ItemEvent {
  const factory _CreateItemEvent() = _$CreateItemEventImpl;
}

/// @nodoc
abstract class _$$ReadItemEventImplCopyWith<$Res> {
  factory _$$ReadItemEventImplCopyWith(
    _$ReadItemEventImpl value,
    $Res Function(_$ReadItemEventImpl) then,
  ) = __$$ReadItemEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadItemEventImplCopyWithImpl<$Res>
    extends _$ItemEventCopyWithImpl<$Res, _$ReadItemEventImpl>
    implements _$$ReadItemEventImplCopyWith<$Res> {
  __$$ReadItemEventImplCopyWithImpl(
    _$ReadItemEventImpl _value,
    $Res Function(_$ReadItemEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReadItemEventImpl implements _ReadItemEvent {
  const _$ReadItemEventImpl();

  @override
  String toString() {
    return 'ItemEvent.read()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReadItemEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() read,
    required TResult Function(String value) update,
    required TResult Function() delete,
  }) {
    return read();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? read,
    TResult? Function(String value)? update,
    TResult? Function()? delete,
  }) {
    return read?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? read,
    TResult Function(String value)? update,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateItemEvent value) create,
    required TResult Function(_ReadItemEvent value) read,
    required TResult Function(_UpdateItemEvent value) update,
    required TResult Function(_DeleteItemEvent value) delete,
  }) {
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateItemEvent value)? create,
    TResult? Function(_ReadItemEvent value)? read,
    TResult? Function(_UpdateItemEvent value)? update,
    TResult? Function(_DeleteItemEvent value)? delete,
  }) {
    return read?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateItemEvent value)? create,
    TResult Function(_ReadItemEvent value)? read,
    TResult Function(_UpdateItemEvent value)? update,
    TResult Function(_DeleteItemEvent value)? delete,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(this);
    }
    return orElse();
  }
}

abstract class _ReadItemEvent implements ItemEvent {
  const factory _ReadItemEvent() = _$ReadItemEventImpl;
}

/// @nodoc
abstract class _$$UpdateItemEventImplCopyWith<$Res> {
  factory _$$UpdateItemEventImplCopyWith(
    _$UpdateItemEventImpl value,
    $Res Function(_$UpdateItemEventImpl) then,
  ) = __$$UpdateItemEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UpdateItemEventImplCopyWithImpl<$Res>
    extends _$ItemEventCopyWithImpl<$Res, _$UpdateItemEventImpl>
    implements _$$UpdateItemEventImplCopyWith<$Res> {
  __$$UpdateItemEventImplCopyWithImpl(
    _$UpdateItemEventImpl _value,
    $Res Function(_$UpdateItemEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$UpdateItemEventImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateItemEventImpl implements _UpdateItemEvent {
  const _$UpdateItemEventImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ItemEvent.update(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemEventImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ItemEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemEventImplCopyWith<_$UpdateItemEventImpl> get copyWith =>
      __$$UpdateItemEventImplCopyWithImpl<_$UpdateItemEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() read,
    required TResult Function(String value) update,
    required TResult Function() delete,
  }) {
    return update(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? read,
    TResult? Function(String value)? update,
    TResult? Function()? delete,
  }) {
    return update?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? read,
    TResult Function(String value)? update,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateItemEvent value) create,
    required TResult Function(_ReadItemEvent value) read,
    required TResult Function(_UpdateItemEvent value) update,
    required TResult Function(_DeleteItemEvent value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateItemEvent value)? create,
    TResult? Function(_ReadItemEvent value)? read,
    TResult? Function(_UpdateItemEvent value)? update,
    TResult? Function(_DeleteItemEvent value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateItemEvent value)? create,
    TResult Function(_ReadItemEvent value)? read,
    TResult Function(_UpdateItemEvent value)? update,
    TResult Function(_DeleteItemEvent value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemEvent implements ItemEvent {
  const factory _UpdateItemEvent(final String value) = _$UpdateItemEventImpl;

  String get value;

  /// Create a copy of ItemEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateItemEventImplCopyWith<_$UpdateItemEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteItemEventImplCopyWith<$Res> {
  factory _$$DeleteItemEventImplCopyWith(
    _$DeleteItemEventImpl value,
    $Res Function(_$DeleteItemEventImpl) then,
  ) = __$$DeleteItemEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteItemEventImplCopyWithImpl<$Res>
    extends _$ItemEventCopyWithImpl<$Res, _$DeleteItemEventImpl>
    implements _$$DeleteItemEventImplCopyWith<$Res> {
  __$$DeleteItemEventImplCopyWithImpl(
    _$DeleteItemEventImpl _value,
    $Res Function(_$DeleteItemEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteItemEventImpl implements _DeleteItemEvent {
  const _$DeleteItemEventImpl();

  @override
  String toString() {
    return 'ItemEvent.delete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteItemEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() read,
    required TResult Function(String value) update,
    required TResult Function() delete,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? read,
    TResult? Function(String value)? update,
    TResult? Function()? delete,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? read,
    TResult Function(String value)? update,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateItemEvent value) create,
    required TResult Function(_ReadItemEvent value) read,
    required TResult Function(_UpdateItemEvent value) update,
    required TResult Function(_DeleteItemEvent value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateItemEvent value)? create,
    TResult? Function(_ReadItemEvent value)? read,
    TResult? Function(_UpdateItemEvent value)? update,
    TResult? Function(_DeleteItemEvent value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateItemEvent value)? create,
    TResult Function(_ReadItemEvent value)? read,
    TResult Function(_UpdateItemEvent value)? update,
    TResult Function(_DeleteItemEvent value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _DeleteItemEvent implements ItemEvent {
  const factory _DeleteItemEvent() = _$DeleteItemEventImpl;
}

/// @nodoc
mixin _$ItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialItemState value) initial,
    required TResult Function(_LoadingItemState value) loading,
    required TResult Function(_LoadedtemState value) loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialItemState value)? initial,
    TResult? Function(_LoadingItemState value)? loading,
    TResult? Function(_LoadedtemState value)? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialItemState value)? initial,
    TResult Function(_LoadingItemState value)? loading,
    TResult Function(_LoadedtemState value)? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemStateCopyWith<$Res> {
  factory $ItemStateCopyWith(ItemState value, $Res Function(ItemState) then) =
      _$ItemStateCopyWithImpl<$Res, ItemState>;
}

/// @nodoc
class _$ItemStateCopyWithImpl<$Res, $Val extends ItemState> implements $ItemStateCopyWith<$Res> {
  _$ItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialItemStateImplCopyWith<$Res> {
  factory _$$InitialItemStateImplCopyWith(
    _$InitialItemStateImpl value,
    $Res Function(_$InitialItemStateImpl) then,
  ) = __$$InitialItemStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialItemStateImplCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res, _$InitialItemStateImpl>
    implements _$$InitialItemStateImplCopyWith<$Res> {
  __$$InitialItemStateImplCopyWithImpl(
    _$InitialItemStateImpl _value,
    $Res Function(_$InitialItemStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialItemStateImpl implements _InitialItemState {
  const _$InitialItemStateImpl();

  @override
  String toString() {
    return 'ItemState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialItemStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialItemState value) initial,
    required TResult Function(_LoadingItemState value) loading,
    required TResult Function(_LoadedtemState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialItemState value)? initial,
    TResult? Function(_LoadingItemState value)? loading,
    TResult? Function(_LoadedtemState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialItemState value)? initial,
    TResult Function(_LoadingItemState value)? loading,
    TResult Function(_LoadedtemState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialItemState implements ItemState {
  const factory _InitialItemState() = _$InitialItemStateImpl;
}

/// @nodoc
abstract class _$$LoadingItemStateImplCopyWith<$Res> {
  factory _$$LoadingItemStateImplCopyWith(
    _$LoadingItemStateImpl value,
    $Res Function(_$LoadingItemStateImpl) then,
  ) = __$$LoadingItemStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingItemStateImplCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res, _$LoadingItemStateImpl>
    implements _$$LoadingItemStateImplCopyWith<$Res> {
  __$$LoadingItemStateImplCopyWithImpl(
    _$LoadingItemStateImpl _value,
    $Res Function(_$LoadingItemStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingItemStateImpl implements _LoadingItemState {
  const _$LoadingItemStateImpl();

  @override
  String toString() {
    return 'ItemState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingItemStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialItemState value) initial,
    required TResult Function(_LoadingItemState value) loading,
    required TResult Function(_LoadedtemState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialItemState value)? initial,
    TResult? Function(_LoadingItemState value)? loading,
    TResult? Function(_LoadedtemState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialItemState value)? initial,
    TResult Function(_LoadingItemState value)? loading,
    TResult Function(_LoadedtemState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingItemState implements ItemState {
  const factory _LoadingItemState() = _$LoadingItemStateImpl;
}

/// @nodoc
abstract class _$$LoadedtemStateImplCopyWith<$Res> {
  factory _$$LoadedtemStateImplCopyWith(
    _$LoadedtemStateImpl value,
    $Res Function(_$LoadedtemStateImpl) then,
  ) = __$$LoadedtemStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedtemStateImplCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res, _$LoadedtemStateImpl>
    implements _$$LoadedtemStateImplCopyWith<$Res> {
  __$$LoadedtemStateImplCopyWithImpl(
    _$LoadedtemStateImpl _value,
    $Res Function(_$LoadedtemStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadedtemStateImpl implements _LoadedtemState {
  const _$LoadedtemStateImpl();

  @override
  String toString() {
    return 'ItemState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedtemStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialItemState value) initial,
    required TResult Function(_LoadingItemState value) loading,
    required TResult Function(_LoadedtemState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialItemState value)? initial,
    TResult? Function(_LoadingItemState value)? loading,
    TResult? Function(_LoadedtemState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialItemState value)? initial,
    TResult Function(_LoadingItemState value)? loading,
    TResult Function(_LoadedtemState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedtemState implements ItemState {
  const factory _LoadedtemState() = _$LoadedtemStateImpl;
}
