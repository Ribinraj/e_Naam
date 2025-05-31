import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_naam/core/urls.dart';
import 'package:e_naam/data/banner_model.dart';
import 'package:e_naam/data/verify_otpmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


  void dispose() {
    dio.close();
  }
}
