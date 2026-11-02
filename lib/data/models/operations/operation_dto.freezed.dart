// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OperationDto {

 int get id;@JsonKey(name: 'levy_date') String get levyDate; String get label; double get amount; String get category; String? get source; String? get destination; double get costs;@JsonKey(name: 'is_validate') bool get isValidate;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'subscription_id') int? get subscriptionId;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of OperationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationDtoCopyWith<OperationDto> get copyWith => _$OperationDtoCopyWithImpl<OperationDto>(this as OperationDto, _$identity);

  /// Serializes this OperationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OperationDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.levyDate, _this.levyDate) || other.levyDate == _this.levyDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.costs, _this.costs) || other.costs == _this.costs)&&(identical(other.isValidate, _this.isValidate) || other.isValidate == _this.isValidate)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.subscriptionId, _this.subscriptionId) || other.subscriptionId == _this.subscriptionId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OperationDto;
  return Object.hash(runtimeType,_this.id,_this.levyDate,_this.label,_this.amount,_this.category,_this.source,_this.destination,_this.costs,_this.isValidate,_this.userId,_this.subscriptionId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as OperationDto;
  return 'OperationDto(id: ${_this.id}, levyDate: ${_this.levyDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, source: ${_this.source}, destination: ${_this.destination}, costs: ${_this.costs}, isValidate: ${_this.isValidate}, userId: ${_this.userId}, subscriptionId: ${_this.subscriptionId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $OperationDtoCopyWith<$Res>  {
  factory $OperationDtoCopyWith(OperationDto value, $Res Function(OperationDto) _then) = _$OperationDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'levy_date') String levyDate, String label, double amount, String category, String? source, String? destination, double costs,@JsonKey(name: 'is_validate') bool isValidate,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'subscription_id') int? subscriptionId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$OperationDtoCopyWithImpl<$Res>
    implements $OperationDtoCopyWith<$Res> {
  _$OperationDtoCopyWithImpl(this._self, this._then);

  final OperationDto _self;
  final $Res Function(OperationDto) _then;

/// Create a copy of OperationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? isValidate = null,Object? userId = null,Object? subscriptionId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(OperationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationDto].
extension OperationDtoPatterns on OperationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationDto value)  $default,){
final _that = this;
switch (_that) {
case _OperationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationDto value)?  $default,){
final _that = this;
switch (_that) {
case _OperationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'subscription_id')  int? subscriptionId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationDto() when $default != null:
return $default(_that.id,_that.levyDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.isValidate,_that.userId,_that.subscriptionId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'subscription_id')  int? subscriptionId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OperationDto():
return $default(_that.id,_that.levyDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.isValidate,_that.userId,_that.subscriptionId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'subscription_id')  int? subscriptionId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OperationDto() when $default != null:
return $default(_that.id,_that.levyDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.isValidate,_that.userId,_that.subscriptionId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OperationDto implements OperationDto {
  const _OperationDto({required this.id, @JsonKey(name: 'levy_date') required this.levyDate, required this.label, required this.amount, required this.category, required this.source, required this.destination, required this.costs, @JsonKey(name: 'is_validate') required this.isValidate, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'subscription_id') required this.subscriptionId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _OperationDto.fromJson(Map<String, dynamic> json) => _$OperationDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'levy_date') final  String levyDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override final  String? source;
@override final  String? destination;
@override final  double costs;
@override@JsonKey(name: 'is_validate') final  bool isValidate;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'subscription_id') final  int? subscriptionId;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of OperationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationDtoCopyWith<_OperationDto> get copyWith => __$OperationDtoCopyWithImpl<_OperationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OperationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.levyDate, levyDate) || other.levyDate == levyDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.isValidate, isValidate) || other.isValidate == isValidate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,levyDate,label,amount,category,source,destination,costs,isValidate,userId,subscriptionId,createdAt,updatedAt);
}

@override
String toString() {
    return 'OperationDto(id: $id, levyDate: $levyDate, label: $label, amount: $amount, category: $category, source: $source, destination: $destination, costs: $costs, isValidate: $isValidate, userId: $userId, subscriptionId: $subscriptionId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OperationDtoCopyWith<$Res> implements $OperationDtoCopyWith<$Res> {
  factory _$OperationDtoCopyWith(_OperationDto value, $Res Function(_OperationDto) _then) = __$OperationDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'levy_date') String levyDate, String label, double amount, String category, String? source, String? destination, double costs,@JsonKey(name: 'is_validate') bool isValidate,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'subscription_id') int? subscriptionId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$OperationDtoCopyWithImpl<$Res>
    implements _$OperationDtoCopyWith<$Res> {
  __$OperationDtoCopyWithImpl(this._self, this._then);

  final _OperationDto _self;
  final $Res Function(_OperationDto) _then;

/// Create a copy of OperationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? isValidate = null,Object? userId = null,Object? subscriptionId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_OperationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
