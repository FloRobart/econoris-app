// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionUpdateDto {

 int get id;@JsonKey(name: 'start_date') String get startDate; String get label; double get amount; String get category; String? get source; String? get destination; double get costs; bool get active;@JsonKey(name: 'interval_value') int get intervalValue;@JsonKey(name: 'interval_unit') String get intervalUnit;@JsonKey(name: 'day_of_month') int get dayOfMonth;
/// Create a copy of SubscriptionUpdateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionUpdateDtoCopyWith<SubscriptionUpdateDto> get copyWith => _$SubscriptionUpdateDtoCopyWithImpl<SubscriptionUpdateDto>(this as SubscriptionUpdateDto, _$identity);

  /// Serializes this SubscriptionUpdateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubscriptionUpdateDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionUpdateDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.costs, _this.costs) || other.costs == _this.costs)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.intervalValue, _this.intervalValue) || other.intervalValue == _this.intervalValue)&&(identical(other.intervalUnit, _this.intervalUnit) || other.intervalUnit == _this.intervalUnit)&&(identical(other.dayOfMonth, _this.dayOfMonth) || other.dayOfMonth == _this.dayOfMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubscriptionUpdateDto;
  return Object.hash(runtimeType,_this.id,_this.startDate,_this.label,_this.amount,_this.category,_this.source,_this.destination,_this.costs,_this.active,_this.intervalValue,_this.intervalUnit,_this.dayOfMonth);
}

@override
String toString() {
  final _this = this as SubscriptionUpdateDto;
  return 'SubscriptionUpdateDto(id: ${_this.id}, startDate: ${_this.startDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, source: ${_this.source}, destination: ${_this.destination}, costs: ${_this.costs}, active: ${_this.active}, intervalValue: ${_this.intervalValue}, intervalUnit: ${_this.intervalUnit}, dayOfMonth: ${_this.dayOfMonth})';
}


}

/// @nodoc
abstract mixin class $SubscriptionUpdateDtoCopyWith<$Res>  {
  factory $SubscriptionUpdateDtoCopyWith(SubscriptionUpdateDto value, $Res Function(SubscriptionUpdateDto) _then) = _$SubscriptionUpdateDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'start_date') String startDate, String label, double amount, String category, String? source, String? destination, double costs, bool active,@JsonKey(name: 'interval_value') int intervalValue,@JsonKey(name: 'interval_unit') String intervalUnit,@JsonKey(name: 'day_of_month') int dayOfMonth
});




}
/// @nodoc
class _$SubscriptionUpdateDtoCopyWithImpl<$Res>
    implements $SubscriptionUpdateDtoCopyWith<$Res> {
  _$SubscriptionUpdateDtoCopyWithImpl(this._self, this._then);

  final SubscriptionUpdateDto _self;
  final $Res Function(SubscriptionUpdateDto) _then;

/// Create a copy of SubscriptionUpdateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? active = null,Object? intervalValue = null,Object? intervalUnit = null,Object? dayOfMonth = null,}) {
  return _then(SubscriptionUpdateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,intervalValue: null == intervalValue ? _self.intervalValue : intervalValue // ignore: cast_nullable_to_non_nullable
as int,intervalUnit: null == intervalUnit ? _self.intervalUnit : intervalUnit // ignore: cast_nullable_to_non_nullable
as String,dayOfMonth: null == dayOfMonth ? _self.dayOfMonth : dayOfMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionUpdateDto].
extension SubscriptionUpdateDtoPatterns on SubscriptionUpdateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionUpdateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionUpdateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionUpdateDto value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionUpdateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionUpdateDto value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionUpdateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'start_date')  String startDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active, @JsonKey(name: 'interval_value')  int intervalValue, @JsonKey(name: 'interval_unit')  String intervalUnit, @JsonKey(name: 'day_of_month')  int dayOfMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionUpdateDto() when $default != null:
return $default(_that.id,_that.startDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.intervalValue,_that.intervalUnit,_that.dayOfMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'start_date')  String startDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active, @JsonKey(name: 'interval_value')  int intervalValue, @JsonKey(name: 'interval_unit')  String intervalUnit, @JsonKey(name: 'day_of_month')  int dayOfMonth)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionUpdateDto():
return $default(_that.id,_that.startDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.intervalValue,_that.intervalUnit,_that.dayOfMonth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'start_date')  String startDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs,  bool active, @JsonKey(name: 'interval_value')  int intervalValue, @JsonKey(name: 'interval_unit')  String intervalUnit, @JsonKey(name: 'day_of_month')  int dayOfMonth)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionUpdateDto() when $default != null:
return $default(_that.id,_that.startDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.active,_that.intervalValue,_that.intervalUnit,_that.dayOfMonth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionUpdateDto implements SubscriptionUpdateDto {
  const _SubscriptionUpdateDto({required this.id, @JsonKey(name: 'start_date') required this.startDate, required this.label, required this.amount, required this.category, required this.source, required this.destination, this.costs = 0.0, required this.active, @JsonKey(name: 'interval_value') required this.intervalValue, @JsonKey(name: 'interval_unit') required this.intervalUnit, @JsonKey(name: 'day_of_month') required this.dayOfMonth});
  factory _SubscriptionUpdateDto.fromJson(Map<String, dynamic> json) => _$SubscriptionUpdateDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'start_date') final  String startDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override final  String? source;
@override final  String? destination;
@override@JsonKey() final  double costs;
@override final  bool active;
@override@JsonKey(name: 'interval_value') final  int intervalValue;
@override@JsonKey(name: 'interval_unit') final  String intervalUnit;
@override@JsonKey(name: 'day_of_month') final  int dayOfMonth;

/// Create a copy of SubscriptionUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionUpdateDtoCopyWith<_SubscriptionUpdateDto> get copyWith => __$SubscriptionUpdateDtoCopyWithImpl<_SubscriptionUpdateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionUpdateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionUpdateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.active, active) || other.active == active)&&(identical(other.intervalValue, intervalValue) || other.intervalValue == intervalValue)&&(identical(other.intervalUnit, intervalUnit) || other.intervalUnit == intervalUnit)&&(identical(other.dayOfMonth, dayOfMonth) || other.dayOfMonth == dayOfMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,label,amount,category,source,destination,costs,active,intervalValue,intervalUnit,dayOfMonth);
}

@override
String toString() {
    return 'SubscriptionUpdateDto(id: $id, startDate: $startDate, label: $label, amount: $amount, category: $category, source: $source, destination: $destination, costs: $costs, active: $active, intervalValue: $intervalValue, intervalUnit: $intervalUnit, dayOfMonth: $dayOfMonth)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionUpdateDtoCopyWith<$Res> implements $SubscriptionUpdateDtoCopyWith<$Res> {
  factory _$SubscriptionUpdateDtoCopyWith(_SubscriptionUpdateDto value, $Res Function(_SubscriptionUpdateDto) _then) = __$SubscriptionUpdateDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'start_date') String startDate, String label, double amount, String category, String? source, String? destination, double costs, bool active,@JsonKey(name: 'interval_value') int intervalValue,@JsonKey(name: 'interval_unit') String intervalUnit,@JsonKey(name: 'day_of_month') int dayOfMonth
});




}
/// @nodoc
class __$SubscriptionUpdateDtoCopyWithImpl<$Res>
    implements _$SubscriptionUpdateDtoCopyWith<$Res> {
  __$SubscriptionUpdateDtoCopyWithImpl(this._self, this._then);

  final _SubscriptionUpdateDto _self;
  final $Res Function(_SubscriptionUpdateDto) _then;

/// Create a copy of SubscriptionUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? active = null,Object? intervalValue = null,Object? intervalUnit = null,Object? dayOfMonth = null,}) {
  return _then(_SubscriptionUpdateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,intervalValue: null == intervalValue ? _self.intervalValue : intervalValue // ignore: cast_nullable_to_non_nullable
as int,intervalUnit: null == intervalUnit ? _self.intervalUnit : intervalUnit // ignore: cast_nullable_to_non_nullable
as String,dayOfMonth: null == dayOfMonth ? _self.dayOfMonth : dayOfMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
