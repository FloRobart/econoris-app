// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDto {

 int get id; String get email; String get pseudo;@JsonKey(name: 'auth_methods_id') int get authMethodsId;@JsonKey(name: 'is_connected') bool get isConnected;@JsonKey(name: 'is_verified_email') bool get isVerifiedEmail;@JsonKey(name: 'last_logout_at') String get lastLogoutAt;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDtoCopyWith<UserDto> get copyWith => _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.pseudo, _this.pseudo) || other.pseudo == _this.pseudo)&&(identical(other.authMethodsId, _this.authMethodsId) || other.authMethodsId == _this.authMethodsId)&&(identical(other.isConnected, _this.isConnected) || other.isConnected == _this.isConnected)&&(identical(other.isVerifiedEmail, _this.isVerifiedEmail) || other.isVerifiedEmail == _this.isVerifiedEmail)&&(identical(other.lastLogoutAt, _this.lastLogoutAt) || other.lastLogoutAt == _this.lastLogoutAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserDto;
  return Object.hash(runtimeType,_this.id,_this.email,_this.pseudo,_this.authMethodsId,_this.isConnected,_this.isVerifiedEmail,_this.lastLogoutAt,_this.createdAt);
}

@override
String toString() {
  final _this = this as UserDto;
  return 'UserDto(id: ${_this.id}, email: ${_this.email}, pseudo: ${_this.pseudo}, authMethodsId: ${_this.authMethodsId}, isConnected: ${_this.isConnected}, isVerifiedEmail: ${_this.isVerifiedEmail}, lastLogoutAt: ${_this.lastLogoutAt}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res>  {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) = _$UserDtoCopyWithImpl;
@useResult
$Res call({
 int id, String email, String pseudo,@JsonKey(name: 'auth_methods_id') int authMethodsId,@JsonKey(name: 'is_connected') bool isConnected,@JsonKey(name: 'is_verified_email') bool isVerifiedEmail,@JsonKey(name: 'last_logout_at') String lastLogoutAt,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$UserDtoCopyWithImpl<$Res>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? pseudo = null,Object? authMethodsId = null,Object? isConnected = null,Object? isVerifiedEmail = null,Object? lastLogoutAt = null,Object? createdAt = null,}) {
  return _then(UserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pseudo: null == pseudo ? _self.pseudo : pseudo // ignore: cast_nullable_to_non_nullable
as String,authMethodsId: null == authMethodsId ? _self.authMethodsId : authMethodsId // ignore: cast_nullable_to_non_nullable
as int,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,isVerifiedEmail: null == isVerifiedEmail ? _self.isVerifiedEmail : isVerifiedEmail // ignore: cast_nullable_to_non_nullable
as bool,lastLogoutAt: null == lastLogoutAt ? _self.lastLogoutAt : lastLogoutAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDto].
extension UserDtoPatterns on UserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDto value)  $default,){
final _that = this;
switch (_that) {
case _UserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String pseudo, @JsonKey(name: 'auth_methods_id')  int authMethodsId, @JsonKey(name: 'is_connected')  bool isConnected, @JsonKey(name: 'is_verified_email')  bool isVerifiedEmail, @JsonKey(name: 'last_logout_at')  String lastLogoutAt, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.email,_that.pseudo,_that.authMethodsId,_that.isConnected,_that.isVerifiedEmail,_that.lastLogoutAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String pseudo, @JsonKey(name: 'auth_methods_id')  int authMethodsId, @JsonKey(name: 'is_connected')  bool isConnected, @JsonKey(name: 'is_verified_email')  bool isVerifiedEmail, @JsonKey(name: 'last_logout_at')  String lastLogoutAt, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserDto():
return $default(_that.id,_that.email,_that.pseudo,_that.authMethodsId,_that.isConnected,_that.isVerifiedEmail,_that.lastLogoutAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String pseudo, @JsonKey(name: 'auth_methods_id')  int authMethodsId, @JsonKey(name: 'is_connected')  bool isConnected, @JsonKey(name: 'is_verified_email')  bool isVerifiedEmail, @JsonKey(name: 'last_logout_at')  String lastLogoutAt, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.email,_that.pseudo,_that.authMethodsId,_that.isConnected,_that.isVerifiedEmail,_that.lastLogoutAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDto implements UserDto {
  const _UserDto({required this.id, required this.email, required this.pseudo, @JsonKey(name: 'auth_methods_id') required this.authMethodsId, @JsonKey(name: 'is_connected') required this.isConnected, @JsonKey(name: 'is_verified_email') required this.isVerifiedEmail, @JsonKey(name: 'last_logout_at') required this.lastLogoutAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

@override final  int id;
@override final  String email;
@override final  String pseudo;
@override@JsonKey(name: 'auth_methods_id') final  int authMethodsId;
@override@JsonKey(name: 'is_connected') final  bool isConnected;
@override@JsonKey(name: 'is_verified_email') final  bool isVerifiedEmail;
@override@JsonKey(name: 'last_logout_at') final  String lastLogoutAt;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDtoCopyWith<_UserDto> get copyWith => __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.pseudo, pseudo) || other.pseudo == pseudo)&&(identical(other.authMethodsId, authMethodsId) || other.authMethodsId == authMethodsId)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.isVerifiedEmail, isVerifiedEmail) || other.isVerifiedEmail == isVerifiedEmail)&&(identical(other.lastLogoutAt, lastLogoutAt) || other.lastLogoutAt == lastLogoutAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,email,pseudo,authMethodsId,isConnected,isVerifiedEmail,lastLogoutAt,createdAt);
}

@override
String toString() {
    return 'UserDto(id: $id, email: $email, pseudo: $pseudo, authMethodsId: $authMethodsId, isConnected: $isConnected, isVerifiedEmail: $isVerifiedEmail, lastLogoutAt: $lastLogoutAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) = __$UserDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String pseudo,@JsonKey(name: 'auth_methods_id') int authMethodsId,@JsonKey(name: 'is_connected') bool isConnected,@JsonKey(name: 'is_verified_email') bool isVerifiedEmail,@JsonKey(name: 'last_logout_at') String lastLogoutAt,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? pseudo = null,Object? authMethodsId = null,Object? isConnected = null,Object? isVerifiedEmail = null,Object? lastLogoutAt = null,Object? createdAt = null,}) {
  return _then(_UserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pseudo: null == pseudo ? _self.pseudo : pseudo // ignore: cast_nullable_to_non_nullable
as String,authMethodsId: null == authMethodsId ? _self.authMethodsId : authMethodsId // ignore: cast_nullable_to_non_nullable
as int,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,isVerifiedEmail: null == isVerifiedEmail ? _self.isVerifiedEmail : isVerifiedEmail // ignore: cast_nullable_to_non_nullable
as bool,lastLogoutAt: null == lastLogoutAt ? _self.lastLogoutAt : lastLogoutAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
