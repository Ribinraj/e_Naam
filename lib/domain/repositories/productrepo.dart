import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_naam/core/urls.dart';
import 'package:e_naam/data/banner_model.dart';
import 'package:e_naam/data/category_model.dart';
import 'package:e_naam/data/notification_model.dart';
import 'package:e_naam/data/productmodel.dart';
import 'package:e_naam/data/redeem_requestmodel.dart';
import 'package:e_naam/data/redumptionrequests_model.dart';
import 'package:e_naam/data/transactions_model.dart';

import 'package:e_naam/widgets/custom_sharedpreferences.dart';
import 'package:flutter/material.dart';

class ApiResponse<T> {
  final T? data;
  final String message;
  final bool error;
  final int status;

  ApiResponse(
      {this.data,
      required this.message,
      required this.error,
      required this.status});
}

class Productrepo {
  final Dio dio;

  Productrepo({Dio? dio})
      : dio = dio ??
            Dio(BaseOptions(
                baseUrl: Endpoints.baseUrl,
                headers: {'Content-Type': 'application/json'}));

  ///----------------------fetch banners-----------------------------////
  Future<ApiResponse<List<BannerModel>>> fetchbanner() async {
    try {
      // final token = await getUserToken();
      Response response = await dio.get(
        Endpoints.fetchbanners,
        //options: Options(headers: {'Authorization': token}),
      );

      final responseData = response.data;
      if (!responseData["error"] && responseData["status"] == 200) {
        final List<dynamic> bannerslist = responseData['data'];
        List<BannerModel> banner =
            bannerslist.map((banner) => BannerModel.fromJson(banner)).toList();
        return ApiResponse(
          data: banner,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    }
  }

/////////////---------------fetchcategory-------------/////////////////
  Future<ApiResponse<List<CategoryModel>>> fetchcategories() async {
    try {
      final token = await getUserToken();
      Response response = await dio.get(
        Endpoints.categories,
        options: Options(headers: {'Authorization': token}),
      );

      final responseData = response.data;
      if (!responseData["error"] && responseData["status"] == 200) {
        final List<dynamic> categorylist = responseData['data'];
        List<CategoryModel> category = categorylist
            .map((category) => CategoryModel.fromJson(category))
            .toList();
        return ApiResponse(
          data: category,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    }
  }

  //////////-------------fetchproduct-----------------------//////////////////////
  Future<ApiResponse<List<ProductModel>>> fetchproducts(
      {required String categoryId}) async {
    try {
      final token = await getUserToken();
      log(Endpoints.products);
      Response response = await dio.get(
        Endpoints.products,
        data: {'categoryId': categoryId},
        //queryParameters: {'categoryId': categoryId},
        options: Options(headers: {'Authorization': token}),
      );
      log("Response received: ${response.statusCode}");
      final responseData = response.data;
      log(responseData["status"].toString());
      // log(responseData);
      if (!responseData["error"] && responseData["status"] == 200) {
        log('in');
        final List<dynamic> productlist = responseData['data'];
        //log(productlist.toString());
        List<ProductModel> products = productlist
            .map((product) => ProductModel.fromJson(product))
            .toList();
        // log(products.length.toString());
        return ApiResponse(
          data: products,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        log('erorrrrrrrrrrrrrrror');
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    }
  }
  //////////-------------fetchlatestproduct-----------------------//////////////////////
  Future<ApiResponse<List<ProductModel>>> fetchlatestproducts(
      ) async {
    try {
      final token = await getUserToken();
      log(Endpoints.latestproducts);
      Response response = await dio.get(
        Endpoints.latestproducts,
       
        //queryParameters: {'categoryId': categoryId},
        options: Options(headers: {'Authorization': token}),
      );
      log("Response received latestproduct: ${response.statusCode}");
      final responseData = response.data;
      log(responseData["status"].toString());
      // log(responseData);
      if (!responseData["error"] && responseData["status"] == 200) {
    
        final List<dynamic> productlist = responseData['data'];
        //log(productlist.toString());
        List<ProductModel> products = productlist
            .map((product) => ProductModel.fromJson(product))
            .toList();
        // log(products.length.toString());
        return ApiResponse(
          data: products,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        log('erorrrrrrrrrrrrrrror');
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    }
  }
  //////////-------------RedeemRequest-----------------///////////////////
  Future<ApiResponse> redeemrequest(
      {required RedeemRequestModel redeemdata}) async {
    try {
      final token = await getUserToken();

      Response response = await dio.post(Endpoints.redeemrequest,
          options: Options(headers: {'Authorization': token}),
          data: redeemdata);

      final responseData = response.data;
      log('response${responseData['status']}');
      if (!responseData["error"] && responseData["status"] == 200) {
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    } catch (e) {
      // Add a general catch block for other exceptions
      log("Unexpected error: $e");
      return ApiResponse(
        data: null,
        message: 'Unexpected error: $e',
        error: true,
        status: 500,
      );
    }
  }
////////////-----------fetchnotification-----------////////////////////
  Future<ApiResponse<List<NotificationModel>>> fetchnotifications(
      ) async {
    try {
      final token = await getUserToken();
   
      Response response = await dio.get(
        Endpoints.notifications,
       
        options: Options(headers: {'Authorization': token}),
      );
      log("Response received: ${response.statusCode}");
      final responseData = response.data;
      log(responseData["status"].toString());
      // log(responseData);
      if (!responseData["error"] && responseData["status"] == 200) {
   
        final List<dynamic> notificationlist = responseData['data'];
        //log(productlist.toString());
        List<NotificationModel> notifications = notificationlist
            .map((notification) => NotificationModel.fromJson(notification))
            .toList();
      log(notifications.length.toString());
        return ApiResponse(
          data: notifications,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        log('erorrrrrrrrrrrrrrror');
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    }
  }
////////////-----------fetchtransactions-----------////////////////////
  Future<ApiResponse<List<TransactionsModel>>> fetchtransactions(
      ) async {
    try {
      final token = await getUserToken();
   
      Response response = await dio.get(
        Endpoints.transactions,
       
        options: Options(headers: {'Authorization': token}),
      );
      log("Response received: ${response.statusCode}");
      final responseData = response.data;
      log(responseData["status"].toString());
      // log(responseData);
      if (!responseData["error"] && responseData["status"] == 200) {
   
        final List<dynamic> transactionlist = responseData['data'];
        //log(productlist.toString());
        List<TransactionsModel> transactions = transactionlist
            .map((notification) => TransactionsModel.fromJson(notification))
            .toList();
  
        return ApiResponse(
          data: transactions,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        log('erorrrrrrrrrrrrrrror');
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    }
  }
  ////////////-----------fetchredeemrequests-----------////////////////////
  Future<ApiResponse<List<RedumptionrequestsModel>>> fetchredeemrequests(
      ) async {
    try {
      final token = await getUserToken();
   
      Response response = await dio.get(
        Endpoints.redumptionRequests,
       
        options: Options(headers: {'Authorization': token}),
      );
   
      final responseData = response.data;
      log(responseData["status"].toString());
  
      if (!responseData["error"] && responseData["status"] == 200) {
   
        final List<dynamic> redeemrequestlists = responseData['data'];
     
        List<RedumptionrequestsModel> redeemrequest = redeemrequestlists
            .map((redeemrequest) => RedumptionrequestsModel.fromJson(redeemrequest))
            .toList();
 
        return ApiResponse(
          data: redeemrequest,
          message: responseData['message'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        log('erorrrrrrrrrrrrrrror');
        return ApiResponse(
          data: null,
          message: responseData['message'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
        data: null,
        message: 'Network or server error occurred',
        error: true,
        status: 500,
      );
    }
  }
  void dispose() {
    dio.close();
  }
}
