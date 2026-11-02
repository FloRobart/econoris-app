// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Subscription {

 int get id; String get label; double get amount; String get category; String? get source; String? get destination; double get costs; bool get active;@JsonKey(name: 'interval_value') int get intervalValue;@JsonKey(name: 'interval_unit') String get intervalUnit;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime? get endDate;@JsonKey(name: 'day_of_month') int get dayOfMonth;@JsonKey(name: 'last_generated_at') DateTime? get lastGeneratedAt;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; bool get isSelected;
/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<Subscription> get copyWith => _$SubscriptionCopyWithImpl<Subscription>(this as Subscription, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Subscription;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subscription&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.costs, _this.costs) || other.costs == _this.costs)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.intervalValue, _this.intervalValue) || other.intervalValue == _this.intervalValue)&&(identical(other.intervalUnit, _this.intervalUnit) || other.intervalUnit == _this.intervalUnit)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.dayOfMonth, _this.dayOfMonth) || other.dayOfMonth == _this.dayOfMonth)&&(identical(other.lastGeneratedAt, _this.lastGeneratedAt) || other.lastGeneratedAt == _this.lastGeneratedAt)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.isSelected, _this.isSelected) || other.isSelected == _this.isSelected));
}


@override
int get hashCode {
  final _this = this as Subscription;
  return Object.hash(runtimeType,_this.id,_this.label,_this.amount,_this.category,_this.source,_this.destination,_this.costs,_this.active,_this.intervalValue,_this.intervalUnit,_this.startDate,_this.endDate,_this.dayOfMonth,_this.lastGeneratedAt,_this.userId,_this.createdAt,_this.updatedAt,_this.isSelected);
}

@override
String toString() {
  final _this = this as Subscription;
  return 'Subscription(id: ${_this.id}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, source: ${_this.source}, destination: ${_this.destination}, costs: ${_this.costs}, active: ${_this.active}, intervalValue: ${_this.intervalValue}, intervalUnit: ${_this.intervalUnit}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, dayOfMonth: ${_this.dayOfMonth}, lastGeneratedAt: ${_this.lastGeneratedAt}, userId: ${_this.userId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, isSelected: ${_this.isSelected})';
}


}

/// @nodoc
abstract mixin class $SubscriptionCopyWith<$Res>  {
  factory $SubscriptionCopyWith(Subscription value, $Res Function(Subscription) _then) = _$SubscriptionCopyWithImpl;
@useResult
$Res call({
 int id, String label, double amount, String category, String? source, String? destination, double costs, bool active,@JsonKey(name: 'interval_value') int intervalValue,@JsonKey(name: 'interval_unit') String intervalUnit,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime? endDate,@JsonKey(name: 'day_of_month') int dayOfMonth,@JsonKey(name: 'last_generated_at') DateTime? lastGeneratedAt,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, bool isSelected
});




}
/// @nodoc
class _$SubscriptionCopyWithImpl<$Res>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._self, this._then);

  final Subscription _self;
  final $Res Function(Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? active = null,Object? intervalValue = null,Object? intervalUnit = null,Object? startDate = null,Object? endDate = freezed,Object? dayOfMonth = null,Object? lastGeneratedAt = freezed,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,Object? isSelected = null,}) {
  return _then(Subscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,intervalValue: null == intervalValue ? _self.intervalValue : intervalValue // ignore: cast_nullable_to_non_nullable
as int,intervalUnit: null == intervalUnit ? _self.intervalUnit : intervalUnit // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dayOfMonth: null == dayOfMonth ? _self.dayOfMonth : dayOfMonth // ignore: cast_nullable_to_non_nullable
as int,lastGeneratedAt: freezed == lastGeneratedAt ? _self.lastGeneratedAt : lastGeneratedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Subscription].
extension SubscriptionPatterns on Subscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subscription value)  $default,){
final _that = this;
switch (_that) {
case _Subscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subscription value)?  $default,){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active, @JsonKey(name: 'interval_value')  int intervalValue, @JsonKey(name: 'interval_unit')  String intervalUnit, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'day_of_month')  int dayOfMonth, @JsonKey(name: 'last_generated_at')  DateTime? lastGeneratedAt, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.intervalValue,_that.intervalUnit,_that.startDate,_that.endDate,_that.dayOfMonth,_that.lastGeneratedAt,_that.userId,_that.createdAt,_that.updatedAt,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active, @JsonKey(name: 'interval_value')  int intervalValue, @JsonKey(name: 'interval_unit')  String intervalUnit, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'day_of_month')  int dayOfMonth, @JsonKey(name: 'last_generated_at')  DateTime? lastGeneratedAt, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _Subscription():
return $default(_that.id,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.intervalValue,_that.intervalUnit,_that.startDate,_that.endDate,_that.dayOfMonth,_that.lastGeneratedAt,_that.userId,_that.createdAt,_that.updatedAt,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active, @JsonKey(name: 'interval_value')  int intervalValue, @JsonKey(name: 'interval_unit')  String intervalUnit, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'day_of_month')  int dayOfMonth, @JsonKey(name: 'last_generated_at')  DateTime? lastGeneratedAt, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.intervalValue,_that.intervalUnit,_that.startDate,_that.endDate,_that.dayOfMonth,_that.lastGeneratedAt,_that.userId,_that.createdAt,_that.updatedAt,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc


class _Subscription implements Subscription {
  const _Subscription({required this.id, required this.label, required this.amount, required this.category, required this.source, required this.destination, required this.costs, required this.active, @JsonKey(name: 'interval_value') required this.intervalValue, @JsonKey(name: 'interval_unit') required this.intervalUnit, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'day_of_month') required this.dayOfMonth, @JsonKey(name: 'last_generated_at') required this.lastGeneratedAt, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.isSelected});
  

@override final  int id;
@override final  String label;
@override final  double amount;
@override final  String category;
@override final  String? source;
@override final  String? destination;
@override final  double costs;
@override final  bool active;
@override@JsonKey(name: 'interval_value') final  int intervalValue;
@override@JsonKey(name: 'interval_unit') final  String intervalUnit;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime? endDate;
@override@JsonKey(name: 'day_of_month') final  int dayOfMonth;
@override@JsonKey(name: 'last_generated_at') final  DateTime? lastGeneratedAt;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  bool isSelected;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionCopyWith<_Subscription> get copyWith => __$SubscriptionCopyWithImpl<_Subscription>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.active, active) || other.active == active)&&(identical(other.intervalValue, intervalValue) || other.intervalValue == intervalValue)&&(identical(other.intervalUnit, intervalUnit) || other.intervalUnit == intervalUnit)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.dayOfMonth, dayOfMonth) || other.dayOfMonth == dayOfMonth)&&(identical(other.lastGeneratedAt, lastGeneratedAt) || other.lastGeneratedAt == lastGeneratedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,label,amount,category,source,destination,costs,active,intervalValue,intervalUnit,startDate,endDate,dayOfMonth,lastGeneratedAt,userId,createdAt,updatedAt,isSelected);
}

@override
String toString() {
    return 'Subscription(id: $id, label: $label, amount: $amount, category: $category, source: $source, destination: $destination, costs: $costs, active: $active, intervalValue: $intervalValue, intervalUnit: $intervalUnit, startDate: $startDate, endDate: $endDate, dayOfMonth: $dayOfMonth, lastGeneratedAt: $lastGeneratedAt, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory _$SubscriptionCopyWith(_Subscription value, $Res Function(_Subscription) _then) = __$SubscriptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String label, double amount, String category, String? source, String? destination, double costs, bool active,@JsonKey(name: 'interval_value') int intervalValue,@JsonKey(name: 'interval_unit') String intervalUnit,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime? endDate,@JsonKey(name: 'day_of_month') int dayOfMonth,@JsonKey(name: 'last_generated_at') DateTime? lastGeneratedAt,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, bool isSelected
});




}
/// @nodoc
class __$SubscriptionCopyWithImpl<$Res>
    implements _$SubscriptionCopyWith<$Res> {
  __$SubscriptionCopyWithImpl(this._self, this._then);

  final _Subscription _self;
  final $Res Function(_Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? active = null,Object? intervalValue = null,Object? intervalUnit = null,Object? startDate = null,Object? endDate = freezed,Object? dayOfMonth = null,Object? lastGeneratedAt = freezed,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,Object? isSelected = null,}) {
  return _then(_Subscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,intervalValue: null == intervalValue ? _self.intervalValue : intervalValue // ignore: cast_nullable_to_non_nullable
as int,intervalUnit: null == intervalUnit ? _self.intervalUnit : intervalUnit // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dayOfMonth: null == dayOfMonth ? _self.dayOfMonth : dayOfMonth // ignore: cast_nullable_to_non_nullable
as int,lastGeneratedAt: freezed == lastGeneratedAt ? _self.lastGeneratedAt : lastGeneratedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
