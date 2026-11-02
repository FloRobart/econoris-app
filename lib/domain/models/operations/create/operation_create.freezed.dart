// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationCreate {

@JsonKey(name: 'levy_date') DateTime get levyDate; String get label; double get amount; String get category;@JsonKey(name: 'is_validate') bool get isValidate;
/// Create a copy of OperationCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationCreateCopyWith<OperationCreate> get copyWith => _$OperationCreateCopyWithImpl<OperationCreate>(this as OperationCreate, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OperationCreate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationCreate&&(identical(other.levyDate, _this.levyDate) || other.levyDate == _this.levyDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.isValidate, _this.isValidate) || other.isValidate == _this.isValidate));
}


@override
int get hashCode {
  final _this = this as OperationCreate;
  return Object.hash(runtimeType,_this.levyDate,_this.label,_this.amount,_this.category,_this.isValidate);
}

@override
String toString() {
  final _this = this as OperationCreate;
  return 'OperationCreate(levyDate: ${_this.levyDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, isValidate: ${_this.isValidate})';
}


}

/// @nodoc
abstract mixin class $OperationCreateCopyWith<$Res>  {
  factory $OperationCreateCopyWith(OperationCreate value, $Res Function(OperationCreate) _then) = _$OperationCreateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'levy_date') DateTime levyDate, String label, double amount, String category,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class _$OperationCreateCopyWithImpl<$Res>
    implements $OperationCreateCopyWith<$Res> {
  _$OperationCreateCopyWithImpl(this._self, this._then);

  final OperationCreate _self;
  final $Res Function(OperationCreate) _then;

/// Create a copy of OperationCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? isValidate = null,}) {
  return _then(OperationCreate(
levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationCreate].
extension OperationCreatePatterns on OperationCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationCreate value)  $default,){
final _that = this;
switch (_that) {
case _OperationCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationCreate value)?  $default,){
final _that = this;
switch (_that) {
case _OperationCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'levy_date')  DateTime levyDate,  String label,  double amount,  String category, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationCreate() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'levy_date')  DateTime levyDate,  String label,  double amount,  String category, @JsonKey(name: 'is_validate')  bool isValidate)  $default,) {final _that = this;
switch (_that) {
case _OperationCreate():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'levy_date')  DateTime levyDate,  String label,  double amount,  String category, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,) {final _that = this;
switch (_that) {
case _OperationCreate() when $default != null:
return $default(_that.levyDate,_that.label,_that.amount,_that.category,_that.isValidate);case _:
  return null;

}
}

}

/// @nodoc


class _OperationCreate implements OperationCreate {
  const _OperationCreate({@JsonKey(name: 'levy_date') required this.levyDate, required this.label, required this.amount, required this.category, @JsonKey(name: 'is_validate') this.isValidate = false});
  

@override@JsonKey(name: 'levy_date') final  DateTime levyDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override@JsonKey(name: 'is_validate') final  bool isValidate;

/// Create a copy of OperationCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationCreateCopyWith<_OperationCreate> get copyWith => __$OperationCreateCopyWithImpl<_OperationCreate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationCreate&&(identical(other.levyDate, levyDate) || other.levyDate == levyDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.isValidate, isValidate) || other.isValidate == isValidate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,levyDate,label,amount,category,isValidate);
}

@override
String toString() {
    return 'OperationCreate(levyDate: $levyDate, label: $label, amount: $amount, category: $category, isValidate: $isValidate)';
}


}

/// @nodoc
abstract mixin class _$OperationCreateCopyWith<$Res> implements $OperationCreateCopyWith<$Res> {
  factory _$OperationCreateCopyWith(_OperationCreate value, $Res Function(_OperationCreate) _then) = __$OperationCreateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'levy_date') DateTime levyDate, String label, double amount, String category,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class __$OperationCreateCopyWithImpl<$Res>
    implements _$OperationCreateCopyWith<$Res> {
  __$OperationCreateCopyWithImpl(this._self, this._then);

  final _OperationCreate _self;
  final $Res Function(_OperationCreate) _then;

/// Create a copy of OperationCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? isValidate = null,}) {
  return _then(_OperationCreate(
levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isValidate: null == isValidate ? _self.isValidate : isValidate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
