// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_create_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OperationCreateDto {

@JsonKey(name: 'levy_date') String get levyDate; String get label; double get amount; String get category;@JsonKey(name: 'is_validate') bool get isValidate;
/// Create a copy of OperationCreateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationCreateDtoCopyWith<OperationCreateDto> get copyWith => _$OperationCreateDtoCopyWithImpl<OperationCreateDto>(this as OperationCreateDto, _$identity);

  /// Serializes this OperationCreateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OperationCreateDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationCreateDto&&(identical(other.levyDate, _this.levyDate) || other.levyDate == _this.levyDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.isValidate, _this.isValidate) || other.isValidate == _this.isValidate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OperationCreateDto;
  return Object.hash(runtimeType,_this.levyDate,_this.label,_this.amount,_this.category,_this.isValidate);
}

@override
String toString() {
  final _this = this as OperationCreateDto;
  return 'OperationCreateDto(levyDate: ${_this.levyDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, isValidate: ${_this.isValidate})';
}


}

/// @nodoc
abstract mixin class $OperationCreateDtoCopyWith<$Res>  {
  factory $OperationCreateDtoCopyWith(OperationCreateDto value, $Res Function(OperationCreateDto) _then) = _$OperationCreateDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'levy_date') String levyDate, String label, double amount, String category,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class _$OperationCreateDtoCopyWithImpl<$Res>
    implements $OperationCreateDtoCopyWith<$Res> {
  _$OperationCreateDtoCopyWithImpl(this._self, this._then);

  final OperationCreateDto _self;
  final $Res Function(OperationCreateDto) _then;

/// Create a copy of OperationCreateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? isValidate = null,}) {
  return _then(OperationCreateDto(
levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationCreateDto].
extension OperationCreateDtoPatterns on OperationCreateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationCreateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationCreateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationCreateDto value)  $default,){
final _that = this;
switch (_that) {
case _OperationCreateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationCreateDto value)?  $default,){
final _that = this;
switch (_that) {
case _OperationCreateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationCreateDto() when $default != null:
return $default(_that.levyDate,_that.label,_that.amount,_that.category,_that.isValidate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category, @JsonKey(name: 'is_validate')  bool isValidate)  $default,) {final _that = this;
switch (_that) {
case _OperationCreateDto():
return $default(_that.levyDate,_that.label,_that.amount,_that.category,_that.isValidate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'levy_date')  String levyDate,  String label,  double amount,  String category, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,) {final _that = this;
switch (_that) {
case _OperationCreateDto() when $default != null:
return $default(_that.levyDate,_that.label,_that.amount,_that.category,_that.isValidate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OperationCreateDto implements OperationCreateDto {
  const _OperationCreateDto({@JsonKey(name: 'levy_date') required this.levyDate, required this.label, required this.amount, required this.category, @JsonKey(name: 'is_validate') this.isValidate = true});
  factory _OperationCreateDto.fromJson(Map<String, dynamic> json) => _$OperationCreateDtoFromJson(json);

@override@JsonKey(name: 'levy_date') final  String levyDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override@JsonKey(name: 'is_validate') final  bool isValidate;

/// Create a copy of OperationCreateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationCreateDtoCopyWith<_OperationCreateDto> get copyWith => __$OperationCreateDtoCopyWithImpl<_OperationCreateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OperationCreateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationCreateDto&&(identical(other.levyDate, levyDate) || other.levyDate == levyDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.isValidate, isValidate) || other.isValidate == isValidate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,levyDate,label,amount,category,isValidate);
}

@override
String toString() {
    return 'OperationCreateDto(levyDate: $levyDate, label: $label, amount: $amount, category: $category, isValidate: $isValidate)';
}


}

/// @nodoc
abstract mixin class _$OperationCreateDtoCopyWith<$Res> implements $OperationCreateDtoCopyWith<$Res> {
  factory _$OperationCreateDtoCopyWith(_OperationCreateDto value, $Res Function(_OperationCreateDto) _then) = __$OperationCreateDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'levy_date') String levyDate, String label, double amount, String category,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class __$OperationCreateDtoCopyWithImpl<$Res>
    implements _$OperationCreateDtoCopyWith<$Res> {
  __$OperationCreateDtoCopyWithImpl(this._self, this._then);

  final _OperationCreateDto _self;
  final $Res Function(_OperationCreateDto) _then;

/// Create a copy of OperationCreateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? isValidate = null,}) {
  return _then(_OperationCreateDto(
levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
