import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/auth_model.dart';

part 'deal_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DealModel {
  int? id;
  String? name;
  String? description;
  @JsonKey(
    name: 'category_id',
  )
  int? categoryId;
  @JsonKey(name: 'product_id')
  int? productId;
  int? amount;
  double? price;
  String? shape;
  String? type;
  String? status;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'accept_negotiation')
  int? acceptNegotiation;
  @JsonKey(name: 'send_sample')
  int? sendSample;
  String? geography;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'country_id')
  String? countryId;
  @JsonKey(name: 'account_verified')
  int? accountVerified;
  String? time;
  Category? category;
  Category? product;
  User? user;
  List<Images>? images;
  @JsonKey(name: 'buy_information')
  BuyInformation? buyInformation;
  @JsonKey(name: 'current_user_rate')
  CurrentUserRate? currentUserRate;
  @JsonKey(name: 'current_user_order')
  CurrentUserOrder? currentUserOrder;
  List<CountryModel>? cities;

  DealModel({
    this.id,
    this.name,
    this.description,
    this.categoryId,
    this.productId,
    this.amount,
    this.price,
    this.shape,
    this.type,
    this.status,
    this.userId,
    this.acceptNegotiation,
    this.sendSample,
    this.geography,
    this.createdAt,
    this.countryId,
    this.accountVerified,
    this.time,
    this.category,
    this.product,
    this.user,
    this.images,
    this.buyInformation,
    this.currentUserRate,
    this.cities,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUserOrder {
  int? amount;
  Country? country;

  CurrentUserOrder({this.amount, this.country});

  factory CurrentUserOrder.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserOrderFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserOrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Category {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? imageUrl;

  Category({this.id, this.name, this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Country {
  int? id;
  String? name;
  @JsonKey(name: 'flag_url')
  String? flagUrl;

  Country({this.id, this.name, this.flagUrl});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Images {
  int? id;
  @JsonKey(name: 'attachment_url')
  String? attachmentUrl;

  Images({this.id, this.attachmentUrl});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BuyInformation {
  @JsonKey(name: 'total_amount')
  int? totalAmount;
  @JsonKey(name: 'current_amount')
  int? currentAmount;
  double? price;

  BuyInformation({this.totalAmount, this.currentAmount, this.price});

  factory BuyInformation.fromJson(Map<String, dynamic> json) =>
      _$BuyInformationFromJson(json);

  Map<String, dynamic> toJson() => _$BuyInformationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUserRate {
  num? id;
  @JsonKey(name: 'professionl_stars')
  num? professionlStars;
  @JsonKey(name: 'communication_stars')
  num? communicationStars;
  @JsonKey(name: 'quality_stars')
  num? qualityStars;
  @JsonKey(name: 'experience_stars')
  num? experienceStars;
  @JsonKey(name: 'time_stars')
  num? timeStars;
  @JsonKey(name: 'future_deals_stars')
  num? futureDealsStars;
  String? comment;

  CurrentUserRate(
      this.id,
      this.professionlStars,
      this.communicationStars,
      this.qualityStars,
      this.experienceStars,
      this.timeStars,
      this.futureDealsStars,
      this.comment);

  factory CurrentUserRate.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserRateFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserRateToJson(this);

  num getTotal() {
    num total = (professionlStars ?? 0) +
        (communicationStars ?? 0) +
        (qualityStars ?? 0) +
        (experienceStars ?? 0) +
        (timeStars ?? 0) +
        (futureDealsStars ?? 0);
    return (total / 6).round();
  }
}

@JsonSerializable(explicitToJson: true)
class CountryModel {
  String? name;
  @JsonKey(name: 'flag_url')
  String? flagUrl;
  int? id;

  CountryModel({this.name, this.flagUrl, this.id});

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
