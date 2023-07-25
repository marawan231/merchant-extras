// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealModel _$DealModelFromJson(Map<String, dynamic> json) => DealModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      categoryId: json['category_id'] as String?,
      productId: json['product_id'] as String?,
      amount: json['amount'] as String?,
      price: json['price'] as String?,
      shape: json['shape'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      userId: json['user_id'] as String?,
      acceptNegotiation: json['accept_negotiation'] as String?,
      sendSample: json['send_sample'] as String?,
      geography: json['geography'] as String?,
      createdAt: json['created_at'] as String?,
      countryId: json['country_id'] as String?,
      accountVerified: json['account_verified'] as String?,
      time: json['time'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : Category.fromJson(json['product'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..buyInformation = json['buy_information'] == null
          ? null
          : BuyInformation.fromJson(
              json['buy_information'] as Map<String, dynamic>)
      ..currentUserOrder = json['current_user_order'] == null
          ? null
          : CurrentUserOrder.fromJson(
              json['current_user_order'] as Map<String, dynamic>)
      ..currentUserRate = json['current_user_rate'] == null
          ? null
          : CurrentUserRate.fromJson(
              json['current_user_rate'] as Map<String, dynamic>);

Map<String, dynamic> _$DealModelToJson(DealModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category_id': instance.categoryId,
      'product_id': instance.productId,
      'amount': instance.amount,
      'price': instance.price,
      'shape': instance.shape,
      'type': instance.type,
      'status': instance.status,
      'user_id': instance.userId,
      'accept_negotiation': instance.acceptNegotiation,
      'send_sample': instance.sendSample,
      'geography': instance.geography,
      'created_at': instance.createdAt,
      'country_id': instance.countryId,
      'account_verified': instance.accountVerified,
      'time': instance.time,
      'category': instance.category?.toJson(),
      'product': instance.product?.toJson(),
      'user': instance.user?.toJson(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'buy_information': instance.buyInformation?.toJson(),
      'current_user_order': instance.currentUserOrder?.toJson(),
      'current_user_rate': instance.currentUserRate?.toJson(),
    };

BuyInformation _$BuyInformationFromJson(Map<String, dynamic> json) =>
    BuyInformation(
      totalAmount: json['total_amount'] as num?,
      currentAmount: json['current_amount'] as num?,
      price: json['price'] as num?,
    );

Map<String, dynamic> _$BuyInformationToJson(BuyInformation instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'current_amount': instance.currentAmount,
      'price': instance.price,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as int?,
      name: json['name'] as String?,
      flagUrl: json['flag_url'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'flag_url': instance.flagUrl,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      id: json['id'] as int?,
      attachmentUrl: json['attachment_url'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'attachment_url': instance.attachmentUrl,
    };

CurrentUserOrder _$CurrentUserOrderFromJson(Map<String, dynamic> json) =>
    CurrentUserOrder(
      amount: json['amount'] as int?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentUserOrderToJson(CurrentUserOrder instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'country': instance.country?.toJson(),
    };

CurrentUserRate _$CurrentUserRateFromJson(Map<String, dynamic> json) =>
    CurrentUserRate(
      id: json['id'] as int?,
      professionlStars: json['professionl_stars'] as String?,
      communicationStars: json['communication_stars'] as String?,
      qualityStars: json['quality_stars'] as String?,
      experienceStars: json['experience_stars'] as String?,
      timeStars: json['time_stars'] as String?,
      futureDealsStars: json['future_deals_stars'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$CurrentUserRateToJson(CurrentUserRate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'professionl_stars': instance.professionlStars,
      'communication_stars': instance.communicationStars,
      'quality_stars': instance.qualityStars,
      'experience_stars': instance.experienceStars,
      'time_stars': instance.timeStars,
      'future_deals_stars': instance.futureDealsStars,
      'comment': instance.comment,
    };
