import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUserToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('USER_TOKEN') ?? '';
}
Future<String> getPushToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('FCM_TOKEN') ?? '';
}