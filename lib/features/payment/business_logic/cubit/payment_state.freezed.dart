// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<T, $Res> {
  factory $PaymentStateCopyWith(
          PaymentState<T> value, $Res Function(PaymentState<T>) then) =
      _$PaymentStateCopyWithImpl<T, $Res, PaymentState<T>>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<T, $Res, $Val extends PaymentState<T>>
    implements $PaymentStateCopyWith<T, $Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<T, $Res> {
  factory _$$IdleCopyWith(_$Idle<T> value, $Res Function(_$Idle<T>) then) =
      __$$IdleCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$Idle<T>>
    implements _$$IdleCopyWith<T, $Res> {
  __$$IdleCopyWithImpl(_$Idle<T> _value, $Res Function(_$Idle<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle<T> implements Idle<T> {
  const _$Idle();

  @override
  String toString() {
    return 'PaymentState<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements PaymentState<T> {
  const factory Idle() = _$Idle<T>;
}

/// @nodoc
abstract class _$$BuyQuantityLoadingCopyWith<T, $Res> {
  factory _$$BuyQuantityLoadingCopyWith(_$BuyQuantityLoading<T> value,
          $Res Function(_$BuyQuantityLoading<T>) then) =
      __$$BuyQuantityLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BuyQuantityLoadingCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$BuyQuantityLoading<T>>
    implements _$$BuyQuantityLoadingCopyWith<T, $Res> {
  __$$BuyQuantityLoadingCopyWithImpl(_$BuyQuantityLoading<T> _value,
      $Res Function(_$BuyQuantityLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuyQuantityLoading<T> implements BuyQuantityLoading<T> {
  const _$BuyQuantityLoading();

  @override
  String toString() {
    return 'PaymentState<$T>.buyQuantityLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BuyQuantityLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return buyQuantityLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return buyQuantityLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyQuantityLoading != null) {
      return buyQuantityLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return buyQuantityLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return buyQuantityLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyQuantityLoading != null) {
      return buyQuantityLoading(this);
    }
    return orElse();
  }
}

abstract class BuyQuantityLoading<T> implements PaymentState<T> {
  const factory BuyQuantityLoading() = _$BuyQuantityLoading<T>;
}

/// @nodoc
abstract class _$$BuyQuantitySucceddedCopyWith<T, $Res> {
  factory _$$BuyQuantitySucceddedCopyWith(_$BuyQuantitySuccedded<T> value,
          $Res Function(_$BuyQuantitySuccedded<T>) then) =
      __$$BuyQuantitySucceddedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BuyQuantitySucceddedCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$BuyQuantitySuccedded<T>>
    implements _$$BuyQuantitySucceddedCopyWith<T, $Res> {
  __$$BuyQuantitySucceddedCopyWithImpl(_$BuyQuantitySuccedded<T> _value,
      $Res Function(_$BuyQuantitySuccedded<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuyQuantitySuccedded<T> implements BuyQuantitySuccedded<T> {
  const _$BuyQuantitySuccedded();

  @override
  String toString() {
    return 'PaymentState<$T>.buyQuantitySuccedded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyQuantitySuccedded<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return buyQuantitySuccedded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return buyQuantitySuccedded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyQuantitySuccedded != null) {
      return buyQuantitySuccedded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return buyQuantitySuccedded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return buyQuantitySuccedded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyQuantitySuccedded != null) {
      return buyQuantitySuccedded(this);
    }
    return orElse();
  }
}

abstract class BuyQuantitySuccedded<T> implements PaymentState<T> {
  const factory BuyQuantitySuccedded() = _$BuyQuantitySuccedded<T>;
}

/// @nodoc
abstract class _$$BuyQuantityErrorCopyWith<T, $Res> {
  factory _$$BuyQuantityErrorCopyWith(_$BuyQuantityError<T> value,
          $Res Function(_$BuyQuantityError<T>) then) =
      __$$BuyQuantityErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({DioExceptionType networkExceptions});

  $DioExceptionTypeCopyWith<$Res> get networkExceptions;
}

/// @nodoc
class __$$BuyQuantityErrorCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$BuyQuantityError<T>>
    implements _$$BuyQuantityErrorCopyWith<T, $Res> {
  __$$BuyQuantityErrorCopyWithImpl(
      _$BuyQuantityError<T> _value, $Res Function(_$BuyQuantityError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkExceptions = null,
  }) {
    return _then(_$BuyQuantityError<T>(
      null == networkExceptions
          ? _value.networkExceptions
          : networkExceptions // ignore: cast_nullable_to_non_nullable
              as DioExceptionType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DioExceptionTypeCopyWith<$Res> get networkExceptions {
    return $DioExceptionTypeCopyWith<$Res>(_value.networkExceptions, (value) {
      return _then(_value.copyWith(networkExceptions: value));
    });
  }
}

/// @nodoc

class _$BuyQuantityError<T> implements BuyQuantityError<T> {
  const _$BuyQuantityError(this.networkExceptions);

  @override
  final DioExceptionType networkExceptions;

  @override
  String toString() {
    return 'PaymentState<$T>.buyQuantityError(networkExceptions: $networkExceptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyQuantityError<T> &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkExceptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyQuantityErrorCopyWith<T, _$BuyQuantityError<T>> get copyWith =>
      __$$BuyQuantityErrorCopyWithImpl<T, _$BuyQuantityError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return buyQuantityError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return buyQuantityError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyQuantityError != null) {
      return buyQuantityError(networkExceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return buyQuantityError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return buyQuantityError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyQuantityError != null) {
      return buyQuantityError(this);
    }
    return orElse();
  }
}

abstract class BuyQuantityError<T> implements PaymentState<T> {
  const factory BuyQuantityError(final DioExceptionType networkExceptions) =
      _$BuyQuantityError<T>;

  DioExceptionType get networkExceptions;
  @JsonKey(ignore: true)
  _$$BuyQuantityErrorCopyWith<T, _$BuyQuantityError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuyAllQuantityLoadingCopyWith<T, $Res> {
  factory _$$BuyAllQuantityLoadingCopyWith(_$BuyAllQuantityLoading<T> value,
          $Res Function(_$BuyAllQuantityLoading<T>) then) =
      __$$BuyAllQuantityLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BuyAllQuantityLoadingCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$BuyAllQuantityLoading<T>>
    implements _$$BuyAllQuantityLoadingCopyWith<T, $Res> {
  __$$BuyAllQuantityLoadingCopyWithImpl(_$BuyAllQuantityLoading<T> _value,
      $Res Function(_$BuyAllQuantityLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuyAllQuantityLoading<T> implements BuyAllQuantityLoading<T> {
  const _$BuyAllQuantityLoading();

  @override
  String toString() {
    return 'PaymentState<$T>.buyAllQuantityLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyAllQuantityLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return buyAllQuantityLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return buyAllQuantityLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyAllQuantityLoading != null) {
      return buyAllQuantityLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return buyAllQuantityLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return buyAllQuantityLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyAllQuantityLoading != null) {
      return buyAllQuantityLoading(this);
    }
    return orElse();
  }
}

abstract class BuyAllQuantityLoading<T> implements PaymentState<T> {
  const factory BuyAllQuantityLoading() = _$BuyAllQuantityLoading<T>;
}

/// @nodoc
abstract class _$$BuyAllQuantitySucceddedCopyWith<T, $Res> {
  factory _$$BuyAllQuantitySucceddedCopyWith(_$BuyAllQuantitySuccedded<T> value,
          $Res Function(_$BuyAllQuantitySuccedded<T>) then) =
      __$$BuyAllQuantitySucceddedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BuyAllQuantitySucceddedCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$BuyAllQuantitySuccedded<T>>
    implements _$$BuyAllQuantitySucceddedCopyWith<T, $Res> {
  __$$BuyAllQuantitySucceddedCopyWithImpl(_$BuyAllQuantitySuccedded<T> _value,
      $Res Function(_$BuyAllQuantitySuccedded<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuyAllQuantitySuccedded<T> implements BuyAllQuantitySuccedded<T> {
  const _$BuyAllQuantitySuccedded();

  @override
  String toString() {
    return 'PaymentState<$T>.buyAllQuantitySuccedded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyAllQuantitySuccedded<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return buyAllQuantitySuccedded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return buyAllQuantitySuccedded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyAllQuantitySuccedded != null) {
      return buyAllQuantitySuccedded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return buyAllQuantitySuccedded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return buyAllQuantitySuccedded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyAllQuantitySuccedded != null) {
      return buyAllQuantitySuccedded(this);
    }
    return orElse();
  }
}

abstract class BuyAllQuantitySuccedded<T> implements PaymentState<T> {
  const factory BuyAllQuantitySuccedded() = _$BuyAllQuantitySuccedded<T>;
}

/// @nodoc
abstract class _$$BuyAllQuantityErrorCopyWith<T, $Res> {
  factory _$$BuyAllQuantityErrorCopyWith(_$BuyAllQuantityError<T> value,
          $Res Function(_$BuyAllQuantityError<T>) then) =
      __$$BuyAllQuantityErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({DioExceptionType networkExceptions});

  $DioExceptionTypeCopyWith<$Res> get networkExceptions;
}

/// @nodoc
class __$$BuyAllQuantityErrorCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$BuyAllQuantityError<T>>
    implements _$$BuyAllQuantityErrorCopyWith<T, $Res> {
  __$$BuyAllQuantityErrorCopyWithImpl(_$BuyAllQuantityError<T> _value,
      $Res Function(_$BuyAllQuantityError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkExceptions = null,
  }) {
    return _then(_$BuyAllQuantityError<T>(
      null == networkExceptions
          ? _value.networkExceptions
          : networkExceptions // ignore: cast_nullable_to_non_nullable
              as DioExceptionType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DioExceptionTypeCopyWith<$Res> get networkExceptions {
    return $DioExceptionTypeCopyWith<$Res>(_value.networkExceptions, (value) {
      return _then(_value.copyWith(networkExceptions: value));
    });
  }
}

/// @nodoc

class _$BuyAllQuantityError<T> implements BuyAllQuantityError<T> {
  const _$BuyAllQuantityError(this.networkExceptions);

  @override
  final DioExceptionType networkExceptions;

  @override
  String toString() {
    return 'PaymentState<$T>.buyAllQuantityError(networkExceptions: $networkExceptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyAllQuantityError<T> &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkExceptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyAllQuantityErrorCopyWith<T, _$BuyAllQuantityError<T>> get copyWith =>
      __$$BuyAllQuantityErrorCopyWithImpl<T, _$BuyAllQuantityError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return buyAllQuantityError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return buyAllQuantityError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyAllQuantityError != null) {
      return buyAllQuantityError(networkExceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return buyAllQuantityError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return buyAllQuantityError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (buyAllQuantityError != null) {
      return buyAllQuantityError(this);
    }
    return orElse();
  }
}

abstract class BuyAllQuantityError<T> implements PaymentState<T> {
  const factory BuyAllQuantityError(final DioExceptionType networkExceptions) =
      _$BuyAllQuantityError<T>;

  DioExceptionType get networkExceptions;
  @JsonKey(ignore: true)
  _$$BuyAllQuantityErrorCopyWith<T, _$BuyAllQuantityError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTotalToPayLoadingCopyWith<T, $Res> {
  factory _$$ChangeTotalToPayLoadingCopyWith(_$ChangeTotalToPayLoading<T> value,
          $Res Function(_$ChangeTotalToPayLoading<T>) then) =
      __$$ChangeTotalToPayLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ChangeTotalToPayLoadingCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$ChangeTotalToPayLoading<T>>
    implements _$$ChangeTotalToPayLoadingCopyWith<T, $Res> {
  __$$ChangeTotalToPayLoadingCopyWithImpl(_$ChangeTotalToPayLoading<T> _value,
      $Res Function(_$ChangeTotalToPayLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeTotalToPayLoading<T> implements ChangeTotalToPayLoading<T> {
  const _$ChangeTotalToPayLoading();

  @override
  String toString() {
    return 'PaymentState<$T>.changeTotalToPayLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTotalToPayLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return changeTotalToPayLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return changeTotalToPayLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (changeTotalToPayLoading != null) {
      return changeTotalToPayLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return changeTotalToPayLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return changeTotalToPayLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (changeTotalToPayLoading != null) {
      return changeTotalToPayLoading(this);
    }
    return orElse();
  }
}

abstract class ChangeTotalToPayLoading<T> implements PaymentState<T> {
  const factory ChangeTotalToPayLoading() = _$ChangeTotalToPayLoading<T>;
}

/// @nodoc
abstract class _$$ChangeTotalToPaySucceddedCopyWith<T, $Res> {
  factory _$$ChangeTotalToPaySucceddedCopyWith(
          _$ChangeTotalToPaySuccedded<T> value,
          $Res Function(_$ChangeTotalToPaySuccedded<T>) then) =
      __$$ChangeTotalToPaySucceddedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String totalToPay});
}

/// @nodoc
class __$$ChangeTotalToPaySucceddedCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$ChangeTotalToPaySuccedded<T>>
    implements _$$ChangeTotalToPaySucceddedCopyWith<T, $Res> {
  __$$ChangeTotalToPaySucceddedCopyWithImpl(
      _$ChangeTotalToPaySuccedded<T> _value,
      $Res Function(_$ChangeTotalToPaySuccedded<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalToPay = null,
  }) {
    return _then(_$ChangeTotalToPaySuccedded<T>(
      null == totalToPay
          ? _value.totalToPay
          : totalToPay // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeTotalToPaySuccedded<T> implements ChangeTotalToPaySuccedded<T> {
  const _$ChangeTotalToPaySuccedded(this.totalToPay);

  @override
  final String totalToPay;

  @override
  String toString() {
    return 'PaymentState<$T>.changeTotalToPaySuccedded(totalToPay: $totalToPay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTotalToPaySuccedded<T> &&
            (identical(other.totalToPay, totalToPay) ||
                other.totalToPay == totalToPay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalToPay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTotalToPaySucceddedCopyWith<T, _$ChangeTotalToPaySuccedded<T>>
      get copyWith => __$$ChangeTotalToPaySucceddedCopyWithImpl<T,
          _$ChangeTotalToPaySuccedded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return changeTotalToPaySuccedded(totalToPay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return changeTotalToPaySuccedded?.call(totalToPay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (changeTotalToPaySuccedded != null) {
      return changeTotalToPaySuccedded(totalToPay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return changeTotalToPaySuccedded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return changeTotalToPaySuccedded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (changeTotalToPaySuccedded != null) {
      return changeTotalToPaySuccedded(this);
    }
    return orElse();
  }
}

abstract class ChangeTotalToPaySuccedded<T> implements PaymentState<T> {
  const factory ChangeTotalToPaySuccedded(final String totalToPay) =
      _$ChangeTotalToPaySuccedded<T>;

  String get totalToPay;
  @JsonKey(ignore: true)
  _$$ChangeTotalToPaySucceddedCopyWith<T, _$ChangeTotalToPaySuccedded<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTotalToPayErrorCopyWith<T, $Res> {
  factory _$$ChangeTotalToPayErrorCopyWith(_$ChangeTotalToPayError<T> value,
          $Res Function(_$ChangeTotalToPayError<T>) then) =
      __$$ChangeTotalToPayErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({DioExceptionType networkExceptions});

  $DioExceptionTypeCopyWith<$Res> get networkExceptions;
}

/// @nodoc
class __$$ChangeTotalToPayErrorCopyWithImpl<T, $Res>
    extends _$PaymentStateCopyWithImpl<T, $Res, _$ChangeTotalToPayError<T>>
    implements _$$ChangeTotalToPayErrorCopyWith<T, $Res> {
  __$$ChangeTotalToPayErrorCopyWithImpl(_$ChangeTotalToPayError<T> _value,
      $Res Function(_$ChangeTotalToPayError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkExceptions = null,
  }) {
    return _then(_$ChangeTotalToPayError<T>(
      null == networkExceptions
          ? _value.networkExceptions
          : networkExceptions // ignore: cast_nullable_to_non_nullable
              as DioExceptionType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DioExceptionTypeCopyWith<$Res> get networkExceptions {
    return $DioExceptionTypeCopyWith<$Res>(_value.networkExceptions, (value) {
      return _then(_value.copyWith(networkExceptions: value));
    });
  }
}

/// @nodoc

class _$ChangeTotalToPayError<T> implements ChangeTotalToPayError<T> {
  const _$ChangeTotalToPayError(this.networkExceptions);

  @override
  final DioExceptionType networkExceptions;

  @override
  String toString() {
    return 'PaymentState<$T>.changeTotalToPayError(networkExceptions: $networkExceptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTotalToPayError<T> &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkExceptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTotalToPayErrorCopyWith<T, _$ChangeTotalToPayError<T>>
      get copyWith =>
          __$$ChangeTotalToPayErrorCopyWithImpl<T, _$ChangeTotalToPayError<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() buyQuantityLoading,
    required TResult Function() buyQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyQuantityError,
    required TResult Function() buyAllQuantityLoading,
    required TResult Function() buyAllQuantitySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        buyAllQuantityError,
    required TResult Function() changeTotalToPayLoading,
    required TResult Function(String totalToPay) changeTotalToPaySuccedded,
    required TResult Function(DioExceptionType networkExceptions)
        changeTotalToPayError,
  }) {
    return changeTotalToPayError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? buyQuantityLoading,
    TResult? Function()? buyQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult? Function()? buyAllQuantityLoading,
    TResult? Function()? buyAllQuantitySuccedded,
    TResult? Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult? Function()? changeTotalToPayLoading,
    TResult? Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult? Function(DioExceptionType networkExceptions)?
        changeTotalToPayError,
  }) {
    return changeTotalToPayError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? buyQuantityLoading,
    TResult Function()? buyQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyQuantityError,
    TResult Function()? buyAllQuantityLoading,
    TResult Function()? buyAllQuantitySuccedded,
    TResult Function(DioExceptionType networkExceptions)? buyAllQuantityError,
    TResult Function()? changeTotalToPayLoading,
    TResult Function(String totalToPay)? changeTotalToPaySuccedded,
    TResult Function(DioExceptionType networkExceptions)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (changeTotalToPayError != null) {
      return changeTotalToPayError(networkExceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(BuyQuantityLoading<T> value) buyQuantityLoading,
    required TResult Function(BuyQuantitySuccedded<T> value)
        buyQuantitySuccedded,
    required TResult Function(BuyQuantityError<T> value) buyQuantityError,
    required TResult Function(BuyAllQuantityLoading<T> value)
        buyAllQuantityLoading,
    required TResult Function(BuyAllQuantitySuccedded<T> value)
        buyAllQuantitySuccedded,
    required TResult Function(BuyAllQuantityError<T> value) buyAllQuantityError,
    required TResult Function(ChangeTotalToPayLoading<T> value)
        changeTotalToPayLoading,
    required TResult Function(ChangeTotalToPaySuccedded<T> value)
        changeTotalToPaySuccedded,
    required TResult Function(ChangeTotalToPayError<T> value)
        changeTotalToPayError,
  }) {
    return changeTotalToPayError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult? Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult? Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult? Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult? Function(BuyAllQuantitySuccedded<T> value)?
        buyAllQuantitySuccedded,
    TResult? Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult? Function(ChangeTotalToPayLoading<T> value)?
        changeTotalToPayLoading,
    TResult? Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult? Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
  }) {
    return changeTotalToPayError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(BuyQuantityLoading<T> value)? buyQuantityLoading,
    TResult Function(BuyQuantitySuccedded<T> value)? buyQuantitySuccedded,
    TResult Function(BuyQuantityError<T> value)? buyQuantityError,
    TResult Function(BuyAllQuantityLoading<T> value)? buyAllQuantityLoading,
    TResult Function(BuyAllQuantitySuccedded<T> value)? buyAllQuantitySuccedded,
    TResult Function(BuyAllQuantityError<T> value)? buyAllQuantityError,
    TResult Function(ChangeTotalToPayLoading<T> value)? changeTotalToPayLoading,
    TResult Function(ChangeTotalToPaySuccedded<T> value)?
        changeTotalToPaySuccedded,
    TResult Function(ChangeTotalToPayError<T> value)? changeTotalToPayError,
    required TResult orElse(),
  }) {
    if (changeTotalToPayError != null) {
      return changeTotalToPayError(this);
    }
    return orElse();
  }
}

abstract class ChangeTotalToPayError<T> implements PaymentState<T> {
  const factory ChangeTotalToPayError(
      final DioExceptionType networkExceptions) = _$ChangeTotalToPayError<T>;

  DioExceptionType get networkExceptions;
  @JsonKey(ignore: true)
  _$$ChangeTotalToPayErrorCopyWith<T, _$ChangeTotalToPayError<T>>
      get copyWith => throw _privateConstructorUsedError;
}
