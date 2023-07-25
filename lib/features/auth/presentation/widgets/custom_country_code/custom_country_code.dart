// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show IterableExtension;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
mixin ToAlias {}

/// Country element. This is the element that contains all the information
class CustomCountryCode {
  /// the name of the country
  String? name;

  /// the flag of the country
  final String? flagUri;

  /// the country code (IT,AF..)
  final String? code;

  /// the dial code (+39,+93..)
  final String? dialCode;

  CustomCountryCode({
    this.name,
    this.flagUri,
    this.code,
    this.dialCode,
  });

  @Deprecated('Use `fromCountryCode` instead.')
  factory CustomCountryCode.fromCode(String isoCode) {
    return CustomCountryCode.fromCountryCode(isoCode);
  }

  factory CustomCountryCode.fromCountryCode(String countryCode) {
    final Map<String, String>? jsonCode = codes.firstWhereOrNull(
      (code) => code['code'] == countryCode,
    );
    return CustomCountryCode.fromJson(jsonCode!);
  }

  factory CustomCountryCode.fromDialCode(String dialCode) {
    final Map<String, String>? jsonCode = codes.firstWhereOrNull(
      (code) => code['dial_code'] == dialCode,
    );
    return CustomCountryCode.fromJson(jsonCode!);
  }

  CustomCountryCode localize(BuildContext context) {
    return this
      ..name = CountryLocalizations.of(context)?.translate(code) ?? name;
  }

  factory CustomCountryCode.fromJson(Map<String, dynamic> json) {
    return CustomCountryCode(
      name: json['name'],
      code: json['code'],
      dialCode: json['dial_code'],
      flagUri: 'flags/${json['code'].toLowerCase()}.png',
    );
  }

  @override
  String toString() => "$dialCode";

  String toLongString() => "${toCountryStringOnly()} $dialCode";

  String toCountryStringOnly() {
    return '$cleanName';
  }

  String? get cleanName {
    return name?.replaceAll(RegExp(r'[[\]]'), '').split(',').first;
  }
}
