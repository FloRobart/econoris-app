// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OperationUpdateDto {

 int get id;@JsonKey(name: 'levy_date') String get levyDate; String get label; double get amount; String get category; String? get source; String? get destination; double get costs;@JsonKey(name: 'is_validate') bool get isValidate;
/// Create a copy of OperationUpdateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationUpdateDtoCopyWith<OperationUpdateDto> get copyWith => _$OperationUpdateDtoCopyWithImpl<OperationUpdateDto>(this as OperationUpdateDto, _$identity);

  /// Serializes this OperationUpdateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OperationUpdateDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationUpdateDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.levyDate, _this.levyDate) || other.levyDate == _this.levyDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.costs, _this.costs) || other.costs == _this.costs)&&(identical(other.isValidate, _this.isValidate) || other.isValidate == _this.isValidate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OperationUpdateDto;
  return Object.hash(runtimeType,_this.id,_this.levyDate,_this.label,_this.amount,_this.category,_this.source,_this.destination,_this.costs,_this.isValidate);
}

@override
String toString() {
  final _this = this as OperationUpdateDto;
  return 'OperationUpdateDto(id: ${_this.id}, levyDate: ${_this.levyDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, source: ${_this.source}, destination: ${_this.destination}, costs: ${_this.costs}, isValidate: ${_this.isValidate})';
}


}

/// @nodoc
abstract mixin class $OperationUpdateDtoCopyWith<$Res>  {
  factory $OperationUpdateDtoCopyWith(OperationUpdateDto value, $Res Function(OperationUpdateDto) _then) = _$OperationUpdateDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'levy_date') String levyDate, String label, double amount, String category, String? source, String? destination, double costs,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class _$OperationUpdateDtoCopyWithImpl<$Res>
    implements $OperationUpdateDtoCopyWith<$Res> {
  _$OperationUpdateDtoCopyWithImpl(this._self, this._then);

  final OperationUpdateDto _self;
  final $Res Function(OperationUpdateDto) _then;

/// Create a copy of OperationUpdateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? isValidate = null,}) {
  return _then(OperationUpdateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationUpdateDto].
extension OperationUpdateDtoPatterns on OperationUpdateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationUpdateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationUpdateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationUpdateDto value)  $default,){
final _that = this;
switch (_that) {
case _OperationUpdateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationUpdateDto value)?  $default,){
final _that = this;
switch (_that) {
case _OperationUpdateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationUpdateDto() when $default != null:
return $default(_that.id,_that.levyDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.isValidate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate)  $default,) {final _that = this;
switch (_that) {
case _OperationUpdateDto():
return $default(_that.id,_that.levyDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.isValidate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,) {final _that = this;
switch (_that) {
case _OperationUpdateDto() when $default != null:
return $default(_that.id,_that.levyDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.isValidate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OperationUpdateDto implements OperationUpdateDto {
  const _OperationUpdateDto({required this.id, @JsonKey(name: 'levy_date') required this.levyDate, required this.label, required this.amount, required this.category, required this.source, required this.destination, this.costs = 0.0, @JsonKey(name: 'is_validate') this.isValidate = true});
  factory _OperationUpdateDto.fromJson(Map<String, dynamic> json) => _$OperationUpdateDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'levy_date') final  String levyDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override final  String? source;
@override final  String? destination;
@override@JsonKey() final  double costs;
@override@JsonKey(name: 'is_validate') final  bool isValidate;

/// Create a copy of OperationUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationUpdateDtoCopyWith<_OperationUpdateDto> get copyWith => __$OperationUpdateDtoCopyWithImpl<_OperationUpdateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OperationUpdateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationUpdateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.levyDate, levyDate) || other.levyDate == levyDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.isValidate, isValidate) || other.isValidate == isValidate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,levyDate,label,amount,category,source,destination,costs,isValidate);
}

@override
String toString() {
    return 'OperationUpdateDto(id: $id, levyDate: $levyDate, label: $label, amount: $amount, category: $category, source: $source, destination: $destination, costs: $costs, isValidate: $isValidate)';
}


}

/// @nodoc
abstract mixin class _$OperationUpdateDtoCopyWith<$Res> implements $OperationUpdateDtoCopyWith<$Res> {
  factory _$OperationUpdateDtoCopyWith(_OperationUpdateDto value, $Res Function(_OperationUpdateDto) _then) = __$OperationUpdateDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'levy_date') String levyDate, String label, double amount, String category, String? source, String? destination, double costs,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class __$OperationUpdateDtoCopyWithImpl<$Res>
    implements _$OperationUpdateDtoCopyWith<$Res> {
  __$OperationUpdateDtoCopyWithImpl(this._self, this._then);

  final _OperationUpdateDto _self;
  final $Res Function(_OperationUpdateDto) _then;

/// Create a copy of OperationUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? isValidate = null,}) {
  return _then(_OperationUpdateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as double,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
