// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_currencies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesCurrencies _$CountriesCurrenciesFromJson(Map<String, dynamic> json) =>
    CountriesCurrencies(
      id: json['id'] as int?,
      name: json['name'] as String?,
      currencyCode: json['currency_code'] as String?,
      flagUrl: json['flag_url'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$CountriesCurrenciesToJson(
        CountriesCurrencies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency_code': instance.currencyCode,
      'flag_url': instance.flagUrl,
      'key': instance.key,
    };
