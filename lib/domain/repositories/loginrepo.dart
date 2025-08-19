import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_naam/core/urls.dart';
import 'package:e_naam/data/profile_model.dart';
import 'package:e_naam/data/update_profilemodel.dart';
import 'package:e_naam/data/verify_otpmodel.dart';
import 'package:e_naam/widgets/custom_sharedpreferences.dart';
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
    log('pushtoken when login ${user.pushToken}');
    try {
      Response response = await dio.post(Endpoints.verifyotp, data: user);
      final responseData = response.data;
      log('responsestatus${responseData}');
      log('responsestatus${responseData['status']}');

      if (!responseData["error"] && responseData["status"] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences..setString('USER_TOKEN', responseData["data"]["token"]);
        return ApiResponse(
          data: null,
          message: responseData['messages'] ?? 'Success',
          error: false,
          status: responseData["status"],
        );
      } else {
        return ApiResponse(
          data: null,
          message: responseData['messages'] ?? 'Something went wrong',
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

//////////-------------------fetchprofile---------------//////////////////
  Future<ApiResponse<ProfileModel>> fetchprofile() async {
    try {
      final token = await getUserToken();
      log(token);
      Response response = await dio.get(
        Endpoints.fetchprofile,
        options: Options(headers: {'Authorization': token}),
      );
      log("Response received: ${response.statusCode}");
      final responseData = response.data;
      log("Response data: $responseData");
      //    if (responseData['message'] == "Expired token") {
      //   SharedPreferences preferences = await SharedPreferences.getInstance();
      //   await preferences.remove('USER_TOKEN');
      //   // await preferences.clear();
      // }
      if (!responseData["error"] && responseData["status"] == 200) {
        final user = ProfileModel.fromJson(responseData["data"]);

        //SharedPreferences preferences = await SharedPreferences.getInstance();

        // preferences.setString(
        //     'USER_PUSHTOKEN', responseData["data"]["pushToken"]);

        return ApiResponse(
          data: user,
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

  /////////////---------------updateprofile----------/////////////
  Future<ApiResponse> updateprofile(
      {required UpdateProfilemodel profile}) async {
    try {
      final token = await getUserToken();

      Response response = await dio.post(Endpoints.updateprofile,
          options: Options(headers: {'Authorization': token}), data: profile);

      final responseData = response.data;

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

////////------------qrcodescanner-------/////////
  Future<ApiResponse> qrcodeScanner({required code}) async {
    try {
      final token = await getUserToken();
      Response response = await dio.post(Endpoints.qrcodescanner,
          options: Options(headers: {'Authorization': token}),
          data: {"code": code});
      final responseData = response.data;
      log('qrcode status 1 ${responseData["status"]}');
      if (!responseData["error"] && responseData["status"] == 200) {
        log('qrcode status 2 ${responseData["status"]}');
        return ApiResponse(
            data: null,
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

  void dispose() {
    dio.close();
  }
}
