
import 'package:shared_preferences/shared_preferences.dart';

/// created by dammyololade
/// created on 2019-05-02
/// project 
abstract class SessionManager
{
  static SharedPreferences sharedPreferences;

  static Future<Null> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String KEY_FCM = 'fcm_token';
  static const String KEY_FIRSTNAME = 'first_name';
  static const String KEY_LASTNAME = 'last_name';
  static const String KEY_USER_NAME = 'user_name';
  static const String KEY_ADDRESS = 'address';
  static const String KEY_STATE = 'state';
  static const String KEY_USER_ID = 'user_id';
  static const String KEY_EMAIL = 'email';
  static const String KEY_PHONE = 'phone';
  static const String KEY_COUNTRY = 'country';
  static const String KEY_COUNTRY_CODE = 'country_code';
  static const String KEY_LATITUDE = 'latitude';
  static const String KEY_LONGITUDE = 'longitude';
  static const String KEY_IS_LOGIN = 'is_logged_in';
  static const String KEY_IMAGE_LOCAL_PATH = 'image_local';
  static const String KEY_IMAGE_ONLINE_URL = 'IMAGE_ONLINE';
  static const String KEY_PHOTO_URL = 'photo_url';
  static const String KEY_LOCAL_GOVERNMENT = 'local_govern';
  static const String KEY_LOCATION_PERMISSION_SET = 'location_set';
  static const String KEY_CRASHABLE_MODEL = 'crashable';
  static const String KEY_CRASHED = 'crashed';
  static const String KEY_USER_CATEGORY_ID = 'user_category_id';
  static const String KEY_FAV_ITEM_IDS = 'fav_item_ids';
  static const String KEY_TOKEN = 'token';

  static set fcmToken(String fcmtoken) => sharedPreferences.setString(KEY_FCM, fcmtoken);
  static String get fcmToken => sharedPreferences.getString(KEY_FCM) ?? '';

  static set userName(String userName) => sharedPreferences.setString(KEY_USER_NAME, userName);
  static String get userName => sharedPreferences.getString(KEY_USER_NAME) ?? '';

  static set userId(String userId) => sharedPreferences.setString(KEY_USER_ID, userId);
  static String get userId => sharedPreferences.getString(KEY_USER_ID) ?? '';

  static set address(String address) => sharedPreferences.setString(KEY_ADDRESS, address);
  static String get address => sharedPreferences.getString(KEY_ADDRESS) ?? '';

  static set state(String state) => sharedPreferences.setString(KEY_STATE, state);
  static String get state => sharedPreferences.getString(KEY_STATE) ?? '';

  static set email(String email) => sharedPreferences.setString(KEY_EMAIL, email);
  static String get email => sharedPreferences.getString(KEY_EMAIL) ?? '';

  static set isLoggedIn(bool loggedIn) {
    sharedPreferences.setBool(KEY_IS_LOGIN, loggedIn);
  }
  static bool get isLoggedIn => sharedPreferences.getBool(KEY_IS_LOGIN) ?? false;

  static set isLocationPermSet(bool locationSet) {
    sharedPreferences.setBool(KEY_LOCATION_PERMISSION_SET, locationSet);
  }
  static bool get isLocationPermSet => sharedPreferences.getBool(KEY_LOCATION_PERMISSION_SET) ?? false;

  static String get phone => sharedPreferences.getString(KEY_PHONE) ?? '';
  static set phone(String phone) => sharedPreferences.setString(KEY_PHONE, phone);

  static set longitude(double longitude) => sharedPreferences.setDouble(KEY_LONGITUDE, longitude);
  static double get longitude => sharedPreferences.getDouble(KEY_LONGITUDE) ?? 0.0;

  static set latitude(double latitude) => sharedPreferences.setDouble(KEY_LATITUDE, latitude);
  static double get latitude => sharedPreferences.getDouble(KEY_LATITUDE,) ?? 0.0;

  static String get country => sharedPreferences.getString(KEY_COUNTRY) ?? 'Nigeria';
  static set country(String country) => sharedPreferences.setString(KEY_COUNTRY, country);

  static String get countryCode => sharedPreferences.getString(KEY_COUNTRY_CODE) ?? '';
  static set countryCode(String code) => sharedPreferences.setString(KEY_COUNTRY_CODE, code);

  static String get imageLocalPath => sharedPreferences.getString(KEY_IMAGE_LOCAL_PATH) ?? '';
  static set imageLocalPath(String path) => sharedPreferences.setString(KEY_IMAGE_LOCAL_PATH, path);

  static String get imageOnlineUrl => sharedPreferences.getString(KEY_IMAGE_ONLINE_URL) ?? '';
  static set imageOnlineUrl(String url) => sharedPreferences.setString(KEY_IMAGE_ONLINE_URL, url);

  static String get photoUrl => sharedPreferences.getString(KEY_PHOTO_URL) ?? "";
  static set photoUrl(String url) => sharedPreferences.setString(KEY_PHOTO_URL, url);

  static String get crashableModel => sharedPreferences.getString(KEY_CRASHABLE_MODEL) ?? "";
  static set crashableModel(String model) => sharedPreferences.setString(KEY_CRASHABLE_MODEL, model);

  static String get localGovernment => sharedPreferences.getString(KEY_LOCAL_GOVERNMENT) ?? "";
  static set localGovernment(String lg) => sharedPreferences.setString(KEY_LOCAL_GOVERNMENT, lg);

  static String get userCategoryId => sharedPreferences.getString(KEY_USER_CATEGORY_ID) ?? "";
  static set userCategoryId(String catId) => sharedPreferences.setString(KEY_USER_CATEGORY_ID, catId);

  static List<String> get favItemIds => sharedPreferences.getStringList(KEY_FAV_ITEM_IDS) ?? [];
  static set favItemIds(List<String> ids) => sharedPreferences.setStringList(KEY_FAV_ITEM_IDS, ids);

  static String get token => sharedPreferences.getString(KEY_TOKEN) ?? "";
  static set token(String tk) => sharedPreferences.setString(KEY_TOKEN, tk);

  static String get firstName => sharedPreferences.getString(KEY_FIRSTNAME) ?? '';
  static set firstName(String firstName) => sharedPreferences.setString(KEY_FIRSTNAME, firstName);

  static String get lastName => sharedPreferences.getString(KEY_LASTNAME) ?? '';
  static set lastName(String lastName) => sharedPreferences.setString(KEY_LASTNAME, lastName);

  static set crashed(bool crashed) => sharedPreferences.setBool(KEY_CRASHED, crashed);
  static bool get crashed => sharedPreferences.getBool(KEY_CRASHED) ?? false;

  static void logOut() {
    sharedPreferences.clear();
  }

}