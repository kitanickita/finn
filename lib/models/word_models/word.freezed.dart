// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WordTearOff {
  const _$WordTearOff();

// ignore: unused_element
  _Word call(
      {int id,
      String finnish,
      String translation,
      String english,
      String russian,
      int chapter}) {
    return _Word(
      id: id,
      finnish: finnish,
      translation: translation,
      english: english,
      russian: russian,
      chapter: chapter,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Word = _$WordTearOff();

/// @nodoc
mixin _$Word {
  int get id;
  String get finnish;
  String get translation;
  String get english;
  String get russian;
  int get chapter;

  $WordCopyWith<Word> get copyWith;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String finnish,
      String translation,
      String english,
      String russian,
      int chapter});
}

/// @nodoc
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  final Word _value;
  // ignore: unused_field
  final $Res Function(Word) _then;

  @override
  $Res call({
    Object id = freezed,
    Object finnish = freezed,
    Object translation = freezed,
    Object english = freezed,
    Object russian = freezed,
    Object chapter = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      finnish: finnish == freezed ? _value.finnish : finnish as String,
      translation:
          translation == freezed ? _value.translation : translation as String,
      english: english == freezed ? _value.english : english as String,
      russian: russian == freezed ? _value.russian : russian as String,
      chapter: chapter == freezed ? _value.chapter : chapter as int,
    ));
  }
}

/// @nodoc
abstract class _$WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$WordCopyWith(_Word value, $Res Function(_Word) then) =
      __$WordCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String finnish,
      String translation,
      String english,
      String russian,
      int chapter});
}

/// @nodoc
class __$WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res>
    implements _$WordCopyWith<$Res> {
  __$WordCopyWithImpl(_Word _value, $Res Function(_Word) _then)
      : super(_value, (v) => _then(v as _Word));

  @override
  _Word get _value => super._value as _Word;

  @override
  $Res call({
    Object id = freezed,
    Object finnish = freezed,
    Object translation = freezed,
    Object english = freezed,
    Object russian = freezed,
    Object chapter = freezed,
  }) {
    return _then(_Word(
      id: id == freezed ? _value.id : id as int,
      finnish: finnish == freezed ? _value.finnish : finnish as String,
      translation:
          translation == freezed ? _value.translation : translation as String,
      english: english == freezed ? _value.english : english as String,
      russian: russian == freezed ? _value.russian : russian as String,
      chapter: chapter == freezed ? _value.chapter : chapter as int,
    ));
  }
}

/// @nodoc
class _$_Word implements _Word {
  const _$_Word(
      {this.id,
      this.finnish,
      this.translation,
      this.english,
      this.russian,
      this.chapter});

  @override
  final int id;
  @override
  final String finnish;
  @override
  final String translation;
  @override
  final String english;
  @override
  final String russian;
  @override
  final int chapter;

  @override
  String toString() {
    return 'Word(id: $id, finnish: $finnish, translation: $translation, english: $english, russian: $russian, chapter: $chapter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Word &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.finnish, finnish) ||
                const DeepCollectionEquality()
                    .equals(other.finnish, finnish)) &&
            (identical(other.translation, translation) ||
                const DeepCollectionEquality()
                    .equals(other.translation, translation)) &&
            (identical(other.english, english) ||
                const DeepCollectionEquality()
                    .equals(other.english, english)) &&
            (identical(other.russian, russian) ||
                const DeepCollectionEquality()
                    .equals(other.russian, russian)) &&
            (identical(other.chapter, chapter) ||
                const DeepCollectionEquality().equals(other.chapter, chapter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(finnish) ^
      const DeepCollectionEquality().hash(translation) ^
      const DeepCollectionEquality().hash(english) ^
      const DeepCollectionEquality().hash(russian) ^
      const DeepCollectionEquality().hash(chapter);

  @override
  _$WordCopyWith<_Word> get copyWith =>
      __$WordCopyWithImpl<_Word>(this, _$identity);
}

abstract class _Word implements Word {
  const factory _Word(
      {int id,
      String finnish,
      String translation,
      String english,
      String russian,
      int chapter}) = _$_Word;

  @override
  int get id;
  @override
  String get finnish;
  @override
  String get translation;
  @override
  String get english;
  @override
  String get russian;
  @override
  int get chapter;
  @override
  _$WordCopyWith<_Word> get copyWith;
}
