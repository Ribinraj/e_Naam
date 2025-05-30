import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_naam/core/urls.dart';
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

class Loginrepo {
  final Dio dio;

  Loginrepo({Dio? dio})
      : dio = dio ??
            Dio(BaseOptions(
                baseUrl: Endpoints.baseUrl,
                headers: {'Content-Type': 'application/json'}));

  ///----------------------send otp-----------------------------////

  Future<ApiResponse<Map<String, String>>> sendOtp(
      {required mobileNumber}) async {
    try {
      Response response = await dio
          .post(Endpoints.sendOtp, data: {'userMobileNumber': mobileNumber});
      final responseData = response.data;
      if (!responseData["error"] && responseData["status"] == 200) {
        final usererId = responseData["data"]["userId"].toString();
        final customerType = responseData["data"]["customerType"].toString();
        return ApiResponse(
            data: {"userId": usererId, "customerType": customerType},
            message: responseData["message"] ?? 'Success',
            error: false,
            status: responseData["status"]);
      } else {
        return ApiResponse(
            data: null,
            message: responseData["message"],
            error: true,
            status: responseData["status"]);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      log(e.toString());
      return ApiResponse(
          message: 'Network or server error occured', error: true, status: 500);
    }
  }

  //////////------------verifyotp-----------/////////////////
  Future<ApiResponse> verifyotp({required VerifyOtpmodel user}) async {
    try {
      Response response = await dio.post(Endpoints.verifyotp, data: user);
      final responseData = response.data;
      if (!responseData["errror"] && responseData["status"] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences..setString('USER_TOKEN', responseData["data"]["token"]);
            return ApiResponse(
          data: null,
          message: responseData['messages'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      }else{
            return ApiResponse(
          data: null,
          message: responseData['messages'] ?? 'Something went wrong',
          error: true,
          status: responseData["status"],
        );
      }
    }on DioException catch (e) {
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
//////////---------------resendotp--------------------////////
  Future<ApiResponse<String>> resendotp({required String userId}) async {
    try {
    
      Response response =
          await dio.post(Endpoints.resendotp, data: {"userId": userId});

      final responseData = response.data;
      if (!responseData["error"] && responseData["status"] == 200) {
        return ApiResponse(
          data: responseData["data"]["userId"],
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
