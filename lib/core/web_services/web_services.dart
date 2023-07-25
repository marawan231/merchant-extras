import 'dart:io';

import 'package:dio/dio.dart';
import 'error_model.dart';
import '../../features/deals/data/model/deal_response.dart';
import '../../features/notification/data/models/unread_count_notifications_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/auth_model.dart';
import '../../features/auth/data/models/countries_currencies.dart';
import '../../features/deals/data/model/deal_model.dart';
import '../../features/home/data/models/slider_model.dart';
import '../../features/menu/data/models/add_balance.dart';
import '../../features/menu/data/models/settings_model.dart';
import '../../features/menu/data/models/wallet_info.dart';
import '../../features/notification/data/models/notification_model.dart';
import '../../features/search/data/models/category_model.dart';
import '../../features/search/data/models/products_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: '')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("user/notifications")
  Future<List<NotifiticationModel>> getAllNotifications();

  @GET("sliders")
  Future<List<SliderModel>> getAllSliders();

  @POST("user/authentication")
  Future<AuthModel> login(
    @Field("token") String uid,
  );

  //register
  @POST("user/signup")
  Future<AuthModel> register(
    @Field("token") String? token,
    @Field("name") String? name,
    @Field("country_id") String? countryId,
    @Field("currency_id") String? confirmPassword,
    @Field("email") String? email,
    @Field("phone") String? phone,
    @Field("image_url") String? imageUrl,
    @Field("referrer_key") String? referrerKey,
  );

  @GET("countries")
  Future<List<CountriesCurrencies>> getAllCountriesCurrencies();

  @GET("categories")
  Future<List<CategoryModel>> getAllCategories({@Query('type') String? type});

  @GET("categories/2/products")
  Future<List<ProductsModel>> getAllProducts();

  @GET("user/wallet")
  Future<WalletInfo> getWalletInfo();

  @POST("user/wallet/balance/add")
  Future<AddBalance> addBalanceToWallet(
    @Field("amount") amount,
  );

  @GET("deals/top?geography=international")
  Future<List<DealModel>> getInternationalTopDeals();

  @GET("deals/top?geography=locale")
  Future<List<DealModel>> getLocalTopDeals();

  @GET("user/info")
  Future<User> getUserInfo();

  @POST("user/update")
  @MultiPart()
  Future<ErrorModel> updateProfile({
    @Part(name: "name") String? name,
    @Part(name: "phone") String? phone,
    @Part(name: "currency_id") String? currency,
    @Part(name: "country_id") String? countryId,
    @Part(name: "image") File? image,
  });

  @GET('user/notifications/unread')
  Future<UnreadCountResponse> getUnReadNotificationCount();

  @GET("user/deals")
  Future<List<DealModel>> getDeals();

  @GET("deals/{id}/show")
  Future<DealResponse> getDealsDetails(@Path('id') int id);

//filter  deals by  geography and category id and product id and currency id and price from and price to and amount and shape and order by
  @POST("deals/search")
  Future<List<DealModel>> searchDeals(
    @Field("geography") String? geography,
    @Field("category_id") String? categoryId,
    @Field("product_id") String? productId,
    // @Field("currency_id") String? currencyId,
    @Field("price_from") String? priceFrom,
    @Field("price_to") String? priceTo,
    @Field("amount") String? amount,
    @Field("shape") String? shape,
    @Field("order_by") String? orderBy,
  );

// rate deal by id and stars and comment and future deals stars and time stars and experience stars and quality stars and communication stars and professional stars
  @POST("deals/ratings/create")
  Future<ErrorModel> rateDeal(
    @Field("deal_id") String? dealId,
    @Field("professionl_stars") String? profissionalStars,
    @Field("communication_stars") String? communicationStars,
    @Field("quality_stars") String? qualityStars,
    @Field("experience_stars") String? experienceStars,
    @Field("comment") String? comment,
  );
  //buy quantity  by deal id and quantity and country id
  @POST("deals/buy")
  Future<ErrorModel> buyQuantity(
    @Field("deal_id") String? dealId,
    @Field("qty") String? quantity,
    @Field("country_id") String? countryId,
  );
  //buy all quantity
  @POST("buy/request")
  Future<ErrorModel> buyAllQuantity(
    @Field("deal_id") String? dealId,
    @Field("country_id") String? countryId,
  );
  //get all app settings
  @GET("app/settings")
  Future<List<SettingsModel>> getAllSettings();
//send complain by phone and notes
  @POST("support/tickets/create")
  Future<ErrorModel> sendComplain(
    @Field("phone") String? title,
    @Field("notes") String? message,
  );
//getAllArticles
//    @GET("articles")
//   Future<Article> getAllArticles();
// //-----------------------------------------------------------------------
// //get All STaff Data
//      @GET("staff")
//   Future<Doctor> getAllDoctors();

//   //auth with google
//   @POST("auth/google")
//   Future<SocialAuth> googleAuth(
//     @Field("id") id,
//     @Field("email") email,
//     @Field("firstName") firstName,
//     @Field("lastName") lastName,
//     @Field('picture') picture,
//   );

//   //register
//   @POST("auth/signup")
//   Future<AuthModel> register(
//     @Field("firstName") firstName,
//     @Field("lastName") lastName,
//     @Field("email") email,
//     @Field("password") password,
//   );

//   //get planets producs
//   @GET("products")
//   Future<ProductModel> fetchProducts();
// //get all tools
//    @GET("tools")
//   Future<ToolModel> fetchTools();
//   //get all plants
//     @GET("plants")
//   Future<PlantsModel> fetchPlants();
//   //get all seeds
//     @GET("seeds")
//   Future<SeedsModel> fetchSeeds();

//   //get all forums
//    @GET("forums")
//   Future<ForumsModel> fetchForums();
}
