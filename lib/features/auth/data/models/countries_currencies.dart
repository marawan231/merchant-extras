import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries_currencies.g.dart';

@JsonSerializable(explicitToJson: true)
class CountriesCurrencies {
  int? id;
  String? name;
  @JsonKey(name: 'currency_code')
  String? currencyCode;
  @JsonKey(name: 'flag_url')
  String? flagUrl;
  String? key;

  CountriesCurrencies(
      {this.id, this.name, this.currencyCode, this.flagUrl, this.key});

  factory CountriesCurrencies.fromJson(Map<String, dynamic> json) =>
      _$CountriesCurrenciesFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesCurrenciesToJson(this);
}
