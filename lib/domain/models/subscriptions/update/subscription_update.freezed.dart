// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionUpdate {

 int get id;@JsonKey(name: 'start_date') DateTime get startDate; String get label; double get amount; String get category; String? get source; String? get destination; double get costs; bool get active; String get recurrence;
/// Create a copy of SubscriptionUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionUpdateCopyWith<SubscriptionUpdate> get copyWith => _$SubscriptionUpdateCopyWithImpl<SubscriptionUpdate>(this as SubscriptionUpdate, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SubscriptionUpdate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionUpdate&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.costs, _this.costs) || other.costs == _this.costs)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.recurrence, _this.recurrence) || other.recurrence == _this.recurrence));
}


@override
int get hashCode {
  final _this = this as SubscriptionUpdate;
  return Object.hash(runtimeType,_this.id,_this.startDate,_this.label,_this.amount,_this.category,_this.source,_this.destination,_this.costs,_this.active,_this.recurrence);
}

@override
String toString() {
  final _this = this as SubscriptionUpdate;
  return 'SubscriptionUpdate(id: ${_this.id}, startDate: ${_this.startDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, source: ${_this.source}, destination: ${_this.destination}, costs: ${_this.costs}, active: ${_this.active}, recurrence: ${_this.recurrence})';
}


}

/// @nodoc
abstract mixin class $SubscriptionUpdateCopyWith<$Res>  {
  factory $SubscriptionUpdateCopyWith(SubscriptionUpdate value, $Res Function(SubscriptionUpdate) _then) = _$SubscriptionUpdateCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'start_date') DateTime startDate, String label, double amount, String category, String? source, String? destination, double costs, bool active, String recurrence
});




}
/// @nodoc
class _$SubscriptionUpdateCopyWithImpl<$Res>
    implements $SubscriptionUpdateCopyWith<$Res> {
  _$SubscriptionUpdateCopyWithImpl(this._self, this._then);

  final SubscriptionUpdate _self;
  final $Res Function(SubscriptionUpdate) _then;

/// Create a copy of SubscriptionUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? active = null,Object? recurrence = null,}) {
  return _then(SubscriptionUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionUpdate].
extension SubscriptionUpdatePatterns on SubscriptionUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionUpdate value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'start_date')  DateTime startDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active,  String recurrence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionUpdate() when $default != null:
return $default(_that.id,_that.startDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.recurrence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'start_date')  DateTime startDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active,  String recurrence)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionUpdate():
return $default(_that.id,_that.startDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.recurrence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'start_date')  DateTime startDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active,  String recurrence)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionUpdate() when $default != null:
return $default(_that.id,_that.startDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.recurrence);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionUpdate implements SubscriptionUpdate {
  const _SubscriptionUpdate({required this.id, @JsonKey(name: 'start_date') required this.startDate, required this.label, required this.amount, required this.category, required this.source, required this.destination, this.costs = 0.0, this.active = true, required this.recurrence});
  

@override final  int id;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override final  String? source;
@override final  String? destination;
@override@JsonKey() final  double costs;
@override@JsonKey() final  bool active;
@override final  String recurrence;

/// Create a copy of SubscriptionUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionUpdateCopyWith<_SubscriptionUpdate> get copyWith => __$SubscriptionUpdateCopyWithImpl<_SubscriptionUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.active, active) || other.active == active)&&(identical(other.recurrence, recurrence) || other.recurrence == recurrence));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,label,amount,category,source,destination,costs,active,recurrence);
}

@override
String toString() {
    return 'SubscriptionUpdate(id: $id, startDate: $startDate, label: $label, amount: $amount, category: $category, source: $source, destination: $destination, costs: $costs, active: $active, recurrence: $recurrence)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionUpdateCopyWith<$Res> implements $SubscriptionUpdateCopyWith<$Res> {
  factory _$SubscriptionUpdateCopyWith(_SubscriptionUpdate value, $Res Function(_SubscriptionUpdate) _then) = __$SubscriptionUpdateCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'start_date') DateTime startDate, String label, double amount, String category, String? source, String? destination, double costs, bool active, String recurrence
});




}
/// @nodoc
class __$SubscriptionUpdateCopyWithImpl<$Res>
    implements _$SubscriptionUpdateCopyWith<$Res> {
  __$SubscriptionUpdateCopyWithImpl(this._self, this._then);

  final _SubscriptionUpdate _self;
  final $Res Function(_SubscriptionUpdate) _then;

/// Create a copy of SubscriptionUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? active = null,Object? recurrence = null,}) {
  return _then(_SubscriptionUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
