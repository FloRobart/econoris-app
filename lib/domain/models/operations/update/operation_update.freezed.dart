// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationUpdate {

 int get id;@JsonKey(name: 'levy_date') DateTime get levyDate; String get label; double get amount; String get category; String? get source; String? get destination; double get costs;@JsonKey(name: 'is_validate') bool get isValidate;
/// Create a copy of OperationUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationUpdateCopyWith<OperationUpdate> get copyWith => _$OperationUpdateCopyWithImpl<OperationUpdate>(this as OperationUpdate, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OperationUpdate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationUpdate&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.levyDate, _this.levyDate) || other.levyDate == _this.levyDate)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.costs, _this.costs) || other.costs == _this.costs)&&(identical(other.isValidate, _this.isValidate) || other.isValidate == _this.isValidate));
}


@override
int get hashCode {
  final _this = this as OperationUpdate;
  return Object.hash(runtimeType,_this.id,_this.levyDate,_this.label,_this.amount,_this.category,_this.source,_this.destination,_this.costs,_this.isValidate);
}

@override
String toString() {
  final _this = this as OperationUpdate;
  return 'OperationUpdate(id: ${_this.id}, levyDate: ${_this.levyDate}, label: ${_this.label}, amount: ${_this.amount}, category: ${_this.category}, source: ${_this.source}, destination: ${_this.destination}, costs: ${_this.costs}, isValidate: ${_this.isValidate})';
}


}

/// @nodoc
abstract mixin class $OperationUpdateCopyWith<$Res>  {
  factory $OperationUpdateCopyWith(OperationUpdate value, $Res Function(OperationUpdate) _then) = _$OperationUpdateCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'levy_date') DateTime levyDate, String label, double amount, String category, String? source, String? destination, double costs,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class _$OperationUpdateCopyWithImpl<$Res>
    implements $OperationUpdateCopyWith<$Res> {
  _$OperationUpdateCopyWithImpl(this._self, this._then);

  final OperationUpdate _self;
  final $Res Function(OperationUpdate) _then;

/// Create a copy of OperationUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? isValidate = null,}) {
  return _then(OperationUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [OperationUpdate].
extension OperationUpdatePatterns on OperationUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationUpdate value)  $default,){
final _that = this;
switch (_that) {
case _OperationUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _OperationUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'levy_date')  DateTime levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationUpdate() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'levy_date')  DateTime levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate)  $default,) {final _that = this;
switch (_that) {
case _OperationUpdate():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'levy_date')  DateTime levyDate,  String label,  double amount,  String category,  String? source,  String? destination,  double costs, @JsonKey(name: 'is_validate')  bool isValidate)?  $default,) {final _that = this;
switch (_that) {
case _OperationUpdate() when $default != null:
return $default(_that.id,_that.levyDate,_that.label,_that.amount,_that.category,_that.source,_that.destination,_that.costs,_that.isValidate);case _:
  return null;

}
}

}

/// @nodoc


class _OperationUpdate implements OperationUpdate {
  const _OperationUpdate({required this.id, @JsonKey(name: 'levy_date') required this.levyDate, required this.label, required this.amount, required this.category, required this.source, required this.destination, this.costs = 0.0, @JsonKey(name: 'is_validate') this.isValidate = true});
  

@override final  int id;
@override@JsonKey(name: 'levy_date') final  DateTime levyDate;
@override final  String label;
@override final  double amount;
@override final  String category;
@override final  String? source;
@override final  String? destination;
@override@JsonKey() final  double costs;
@override@JsonKey(name: 'is_validate') final  bool isValidate;

/// Create a copy of OperationUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationUpdateCopyWith<_OperationUpdate> get copyWith => __$OperationUpdateCopyWithImpl<_OperationUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.levyDate, levyDate) || other.levyDate == levyDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.isValidate, isValidate) || other.isValidate == isValidate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,levyDate,label,amount,category,source,destination,costs,isValidate);
}

@override
String toString() {
    return 'OperationUpdate(id: $id, levyDate: $levyDate, label: $label, amount: $amount, category: $category, source: $source, destination: $destination, costs: $costs, isValidate: $isValidate)';
}


}

/// @nodoc
abstract mixin class _$OperationUpdateCopyWith<$Res> implements $OperationUpdateCopyWith<$Res> {
  factory _$OperationUpdateCopyWith(_OperationUpdate value, $Res Function(_OperationUpdate) _then) = __$OperationUpdateCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'levy_date') DateTime levyDate, String label, double amount, String category, String? source, String? destination, double costs,@JsonKey(name: 'is_validate') bool isValidate
});




}
/// @nodoc
class __$OperationUpdateCopyWithImpl<$Res>
    implements _$OperationUpdateCopyWith<$Res> {
  __$OperationUpdateCopyWithImpl(this._self, this._then);

  final _OperationUpdate _self;
  final $Res Function(_OperationUpdate) _then;

/// Create a copy of OperationUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? levyDate = null,Object? label = null,Object? amount = null,Object? category = null,Object? source = freezed,Object? destination = freezed,Object? costs = null,Object? isValidate = null,}) {
  return _then(_OperationUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levyDate: null == levyDate ? _self.levyDate : levyDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
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
