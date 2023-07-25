import 'deal_model.dart';

class DealResponse {
  DealResponse({
      DealModel? deal,
      List<Images>? images, 
      Video? video, 
      BuyInformation? buyInformation,}){
    _deal = deal;
    _images = images;
    _video = video;
    _buyInformation = buyInformation;
}

  DealResponse.fromJson(dynamic json) {
    _deal = json['deal'] != null ? DealModel.fromJson(json['deal']) : null;
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _video = json['video'] != null ? Video.fromJson(json['video']) : null;
    _buyInformation = json['buy_information'] != null ? BuyInformation.fromJson(json['buy_information']) : null;
  }
  DealModel? _deal;
  List<Images>? _images;
  Video? _video;
  BuyInformation? _buyInformation;

  DealModel? get deal => _deal;
  List<Images>? get images => _images;
  Video? get video => _video;
  BuyInformation? get buyInformation => _buyInformation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_deal != null) {
      map['deal'] = _deal?.toJson();
    }
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_video != null) {
      map['video'] = _video?.toJson();
    }
    if (_buyInformation != null) {
      map['buy_information'] = _buyInformation?.toJson();
    }
    return map;
  }

}

class BuyInformation {
  BuyInformation({
      num? totalAmount, 
      num? currentAmount, 
      num? price,}){
    _totalAmount = totalAmount;
    _currentAmount = currentAmount;
    _price = price;
}

  BuyInformation.fromJson(dynamic json) {
    _totalAmount = json['total_amount'];
    _currentAmount = json['current_amount'];
    _price = json['price'];
  }
  num? _totalAmount;
  num? _currentAmount;
  num? _price;

  num? get totalAmount => _totalAmount;
  num? get currentAmount => _currentAmount;
  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_amount'] = _totalAmount;
    map['current_amount'] = _currentAmount;
    map['price'] = _price;
    return map;
  }

}

class Video {
  Video({
      num? id, 
      String? attachmentUrl,}){
    _id = id;
    _attachmentUrl = attachmentUrl;
}

  Video.fromJson(dynamic json) {
    _id = json['id'];
    _attachmentUrl = json['attachment_url'];
  }
  num? _id;
  String? _attachmentUrl;

  num? get id => _id;
  String? get attachmentUrl => _attachmentUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['attachment_url'] = _attachmentUrl;
    return map;
  }

}

// class Images {
//   Images({
//       num? id,
//       String? attachmentUrl,}){
//     _id = id;
//     _attachmentUrl = attachmentUrl;
// }
//
//   Images.fromJson(dynamic json) {
//     _id = json['id'];
//     _attachmentUrl = json['attachment_url'];
//   }
//   num? _id;
//   String? _attachmentUrl;
//
//   num? get id => _id;
//   String? get attachmentUrl => _attachmentUrl;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['attachment_url'] = _attachmentUrl;
//     return map;
//   }
//
// }

// class DealModel {
//   DealModel({
//       num? id,
//       String? name,
//       String? description,
//       String? categoryId,
//       String? productId,
//       String? shape,
//       String? type,
//       String? status,
//       String? userId,
//       String? acceptNegotiation,
//       String? sendSample,
//       String? geography,
//       String? createdAt,
//       String? time,
//       Category? category,
//       Product? product,
//       User? user,
//       List<Cities>? cities,}){
//     _id = id;
//     _name = name;
//     _description = description;
//     _categoryId = categoryId;
//     _productId = productId;
//     _shape = shape;
//     _type = type;
//     _status = status;
//     _userId = userId;
//     _acceptNegotiation = acceptNegotiation;
//     _sendSample = sendSample;
//     _geography = geography;
//     _createdAt = createdAt;
//     _time = time;
//     _category = category;
//     _product = product;
//     _user = user;
//     _cities = cities;
// }
//
//   DealModel.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _description = json['description'];
//     _categoryId = json['category_id'];
//     _productId = json['product_id'];
//     _shape = json['shape'];
//     _type = json['type'];
//     _status = json['status'];
//     _userId = json['user_id'];
//     _acceptNegotiation = json['accept_negotiation'];
//     _sendSample = json['send_sample'];
//     _geography = json['geography'];
//     _createdAt = json['created_at'];
//     _time = json['time'];
//     _category = json['category'] != null ? Category.fromJson(json['category']) : null;
//     _product = json['product'] != null ? Product.fromJson(json['product']) : null;
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     if (json['cities'] != null) {
//       _cities = [];
//       json['cities'].forEach((v) {
//         _cities?.add(Cities.fromJson(v));
//       });
//     }
//   }
//   num? _id;
//   String? _name;
//   String? _description;
//   String? _categoryId;
//   String? _productId;
//   String? _shape;
//   String? _type;
//   String? _status;
//   String? _userId;
//   String? _acceptNegotiation;
//   String? _sendSample;
//   String? _geography;
//   String? _createdAt;
//   String? _time;
//   Category? _category;
//   Product? _product;
//   User? _user;
//   List<Cities>? _cities;
//
//   num? get id => _id;
//   String? get name => _name;
//   String? get description => _description;
//   String? get categoryId => _categoryId;
//   String? get productId => _productId;
//   String? get shape => _shape;
//   String? get type => _type;
//   String? get status => _status;
//   String? get userId => _userId;
//   String? get acceptNegotiation => _acceptNegotiation;
//   String? get sendSample => _sendSample;
//   String? get geography => _geography;
//   String? get createdAt => _createdAt;
//   String? get time => _time;
//   Category? get category => _category;
//   Product? get product => _product;
//   User? get user => _user;
//   List<Cities>? get cities => _cities;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['description'] = _description;
//     map['category_id'] = _categoryId;
//     map['product_id'] = _productId;
//     map['shape'] = _shape;
//     map['type'] = _type;
//     map['status'] = _status;
//     map['user_id'] = _userId;
//     map['accept_negotiation'] = _acceptNegotiation;
//     map['send_sample'] = _sendSample;
//     map['geography'] = _geography;
//     map['created_at'] = _createdAt;
//     map['time'] = _time;
//     if (_category != null) {
//       map['category'] = _category?.toJson();
//     }
//     if (_product != null) {
//       map['product'] = _product?.toJson();
//     }
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     if (_cities != null) {
//       map['cities'] = _cities?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }

// class Cities {
//   Cities({
//       num? id,
//       String? name,}){
//     _id = id;
//     _name = name;
// }
//
//   Cities.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//   }
//   num? _id;
//   String? _name;
//
//   num? get id => _id;
//   String? get name => _name;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     return map;
//   }
//
// }
//
// class User {
//   User({
//       num? id,
//       String? name,
//       String? imageUrl,
//       String? countryId,
//       String? accountVerified,
//       Country? country,}){
//     _id = id;
//     _name = name;
//     _imageUrl = imageUrl;
//     _countryId = countryId;
//     _accountVerified = accountVerified;
//     _country = country;
// }
//
//   User.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _imageUrl = json['image_url'];
//     _countryId = json['country_id'];
//     _accountVerified = json['account_verified'];
//     _country = json['country'] != null ? Country.fromJson(json['country']) : null;
//   }
//   num? _id;
//   String? _name;
//   String? _imageUrl;
//   String? _countryId;
//   String? _accountVerified;
//   Country? _country;
//
//   num? get id => _id;
//   String? get name => _name;
//   String? get imageUrl => _imageUrl;
//   String? get countryId => _countryId;
//   String? get accountVerified => _accountVerified;
//   Country? get country => _country;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['image_url'] = _imageUrl;
//     map['country_id'] = _countryId;
//     map['account_verified'] = _accountVerified;
//     if (_country != null) {
//       map['country'] = _country?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Country {
//   Country({
//       String? name,
//       String? flagUrl,}){
//     _name = name;
//     _flagUrl = flagUrl;
// }
//
//   Country.fromJson(dynamic json) {
//     _name = json['name'];
//     _flagUrl = json['flag_url'];
//   }
//   String? _name;
//   String? _flagUrl;
//
//   String? get name => _name;
//   String? get flagUrl => _flagUrl;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = _name;
//     map['flag_url'] = _flagUrl;
//     return map;
//   }
//
// }
//
// class Product {
//   Product({
//       num? id,
//       String? name,
//       String? imageUrl,}){
//     _id = id;
//     _name = name;
//     _imageUrl = imageUrl;
// }
//
//   Product.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _imageUrl = json['image_url'];
//   }
//   num? _id;
//   String? _name;
//   String? _imageUrl;
//
//   num? get id => _id;
//   String? get name => _name;
//   String? get imageUrl => _imageUrl;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['image_url'] = _imageUrl;
//     return map;
//   }
//
// }
//
// class Category {
//   Category({
//       num? id,
//       String? name,
//       String? imageUrl,}){
//     _id = id;
//     _name = name;
//     _imageUrl = imageUrl;
// }
//
//   Category.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _imageUrl = json['image_url'];
//   }
//   num? _id;
//   String? _name;
//   String? _imageUrl;
//
//   num? get id => _id;
//   String? get name => _name;
//   String? get imageUrl => _imageUrl;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['image_url'] = _imageUrl;
//     return map;
//   }
//
// }