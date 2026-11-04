// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionCreate {

@JsonKey(name: 'start_date') DateTime get startDate; String get label; double get amount; String get category; String get recurrence; bool get active;
/// Create a copy of SubscriptionCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionCreateCopyWith<SubscriptionCreate> get copyWith => _$SubscriptionCreateCopyWithImpl<SubscriptionCreate>(this as SubscriptionCreate, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SubscriptionCreate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionCreate&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.recurrence, _this.recurrence) || other.recurrence == _this.recurrence)&&(identical(other.active, _this.active) || other.active == _this.active));
}


@override
int get hashCode {
  final _this = this as SubscriptionCreate;
  return Object.hash(runtimeType,_this.startDate,_this.label,_this.amount,_this.category,_this.recurrence,_this.active);
}

@override
String toString() {
  final _this = this as SubscriptionCreate;
  return 'SubscriptionCreate(startDate: ${_this.startDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, recurrence: ${_this.recurrence}, active: ${_this.active})';
}


}

/// @nodoc
abstract mixin class $SubscriptionCreateCopyWith<$Res>  {
  factory $SubscriptionCreateCopyWith(SubscriptionCreate value, $Res Function(SubscriptionCreate) _then) = _$SubscriptionCreateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_date') DateTime startDate, String label, double amount, String category, String recurrence, bool active
});




}
/// @nodoc
class _$SubscriptionCreateCopyWithImpl<$Res>
    implements $SubscriptionCreateCopyWith<$Res> {
  _$SubscriptionCreateCopyWithImpl(this._self, this._then);

  final SubscriptionCreate _self;
  final $Res Function(SubscriptionCreate) _then;

/// Create a copy of SubscriptionCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? recurrence = null,Object? active = null,}) {
  return _then(SubscriptionCreate(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionCreate].
extension SubscriptionCreatePatterns on SubscriptionCreate {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionCreate() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionCreate value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionCreate():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionCreate value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionCreate() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime startDate,  String label,  double amount,  String category,  String recurrence,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionCreate() when $default != null:
return $default(_that.startDate,_that.label,_that.amount,_that.category,_that.recurrence,_that.active);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime startDate,  String label,  double amount,  String category,  String recurrence,  bool active)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionCreate():
return $default(_that.startDate,_that.label,_that.amount,_that.category,_that.recurrence,_that.active);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start_date')  DateTime startDate,  String label,  double amount,  String category,  String recurrence,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionCreate() when $default != null:
return $default(_that.startDate,_that.label,_that.amount,_that.category,_that.recurrence,_that.active);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionCreate implements SubscriptionCreate {
  const _SubscriptionCreate({@JsonKey(name: 'start_date') required this.startDate, required this.label, required this.amount, required this.category, required this.recurrence, this.active = true});
  

@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override final  String recurrence;
@override@JsonKey() final  bool active;

/// Create a copy of SubscriptionCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionCreateCopyWith<_SubscriptionCreate> get copyWith => __$SubscriptionCreateCopyWithImpl<_SubscriptionCreate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionCreate&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.recurrence, recurrence) || other.recurrence == recurrence)&&(identical(other.active, active) || other.active == active));
}


@override
int get hashCode {
    return Object.hash(runtimeType,startDate,label,amount,category,recurrence,active);
}

@override
String toString() {
    return 'SubscriptionCreate(startDate: $startDate, label: $label, amount: $amount, category: $category, recurrence: $recurrence, active: $active)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionCreateCopyWith<$Res> implements $SubscriptionCreateCopyWith<$Res> {
  factory _$SubscriptionCreateCopyWith(_SubscriptionCreate value, $Res Function(_SubscriptionCreate) _then) = __$SubscriptionCreateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_date') DateTime startDate, String label, double amount, String category, String recurrence, bool active
});




}
/// @nodoc
class __$SubscriptionCreateCopyWithImpl<$Res>
    implements _$SubscriptionCreateCopyWith<$Res> {
  __$SubscriptionCreateCopyWithImpl(this._self, this._then);

  final _SubscriptionCreate _self;
  final $Res Function(_SubscriptionCreate) _then;

/// Create a copy of SubscriptionCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? recurrence = null,Object? active = null,}) {
  return _then(_SubscriptionCreate(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
