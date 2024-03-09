import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferHelper{

static String userIDkey="USERKEY";
static String userNamekey="USERNAME";
static String userEmailkey="USEREMAILKEY";
static String userPickey="USERPICKEY";
static String userDisplaynamekey="USERDISPLAYNAMEKEY";

Future<bool>saveUserId(String getuserId)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.setString(userIDkey, getuserId);
}
Future<bool>saveUserName(String getuserName)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.setString(userNamekey, getuserName);
}
Future<bool>saveUserEmail(String getuserEmail)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.setString(userEmailkey, getuserEmail);
}
Future<bool>saveUserPic(String getuserPic)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.setString(userPickey, getuserPic);
}
Future<bool>saveUserDisplayName(String getuserDisplayName)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.setString(userDisplaynamekey, getuserDisplayName);
  }

Future<String?>getuserId()async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  return prefs.getString(userIDkey);
}

Future<String?>getuserName()async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  return prefs.getString(userNamekey);

}

Future<String?>getuserEmail()async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  return prefs.getString(userEmailkey);
}
Future<String?>getuserPic()async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  return prefs.getString(userPickey);
}
Future<String?>getuserDisplayName()async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  return prefs.getString(userDisplaynamekey);
}
}