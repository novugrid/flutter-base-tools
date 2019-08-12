import 'package:dio/dio.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';
import 'package:flutter_base_tools/src/Database/SessionManager.dart';
import 'package:flutter_base_tools/src/helpers/Event.dart';


///
/// project: web_mediks
/// @package: helpers
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-06-14
class NetworkUtil {

  String classTag;

  NetworkUtil(String classTag)
  {
    this.classTag = classTag;
    initDio();
  }

  Dio dio;

  Dio initDio()
  {
    dio = new Dio(
        BaseOptions(
          connectTimeout: 30000,
          receiveTimeout: 30000,
        )
    );
  }

  Future<Response> get(String url) async
  {
    var response;
    try {
      response = await dio.get(url,
          options: Options(
            headers: {
              "Authorization": "Bearer ${SessionManager.token}" ,
            },
          )
      );
    }on DioError catch(e) {
      response = e.response;
      switch (e.type) {
        case DioErrorType.CANCEL :
        case DioErrorType.CONNECT_TIMEOUT :
        case DioErrorType.SEND_TIMEOUT :
        case DioErrorType.RECEIVE_TIMEOUT :
        case DioErrorType.DEFAULT :
          eventBus.fire(ErrorEvent(e.message, classTag: classTag));
          break;
        case DioErrorType.RESPONSE :
          validateDioResponse(e.response);
          break;
      }
    }
    return response;
  }

  Future<Response> post(String url, Map<String, dynamic> params) async
  {
    var response;
    try {
      response = await dio.post(url, data: params,
          options: Options(
            headers: {
              "Authorization": "Bearer ${SessionManager.token}",
            },
          ),
          onSendProgress: (sent, total){

          }
      );
    }on DioError catch(e) {
      response = e.response;
      switch (e.type) {
        case DioErrorType.CANCEL :
        case DioErrorType.CONNECT_TIMEOUT :
        case DioErrorType.SEND_TIMEOUT :
        case DioErrorType.RECEIVE_TIMEOUT :
        case DioErrorType.DEFAULT :
          eventBus.fire(ErrorEvent(e.message, classTag: classTag));
          break;
        case DioErrorType.RESPONSE :
          validateDioResponse(e.response);
          break;
      }
    }
    return response;
  }

  Future<Response> put(String url, Map<String, dynamic> params) async
  {
    var response;
    try {
      response = await dio.put(url, data: params,
          options: Options(
            headers: {
              "Authorization": "Bearer ${SessionManager.token}",
            },
          ),
          onSendProgress: (sent, total){

          }
      );
    }on DioError catch(e) {
      response = e.response;
      switch (e.type) {
        case DioErrorType.CANCEL :
        case DioErrorType.CONNECT_TIMEOUT :
        case DioErrorType.SEND_TIMEOUT :
        case DioErrorType.RECEIVE_TIMEOUT :
        case DioErrorType.DEFAULT :
          eventBus.fire(ErrorEvent(e.message, classTag: classTag));
          break;
        case DioErrorType.RESPONSE :
          validateDioResponse(e.response);
          break;
      }
    }
    return response;
  }

  Future<Response> delete(String url, Map<String, dynamic> params) async
  {
    var response;
    try {
      response = await dio.delete(url, data: params,
          options: Options(
            headers: {
              "Authorization": "Bearer ${SessionManager.token}",
            },
          ),
      );
    }on DioError catch(e) {
      response = e.response;
      switch (e.type) {
        case DioErrorType.CANCEL :
        case DioErrorType.CONNECT_TIMEOUT :
        case DioErrorType.SEND_TIMEOUT :
        case DioErrorType.RECEIVE_TIMEOUT :
        case DioErrorType.DEFAULT :
          eventBus.fire(ErrorEvent(e.message, classTag: classTag));
          break;
        case DioErrorType.RESPONSE :
          validateDioResponse(e.response);
          break;
      }
    }
    return response;
  }

  validateDioResponse(Response response)
  {
    try {
      if (response != null && response.statusCode == 401) {
        SessionManager.logOut();
      } else {
        var message = response.data["message"];
        eventBus.fire(ErrorEvent(message, classTag: classTag, response: response));
      }
    } catch(error, stackTrace){
      eventBus.fire(ErrorEvent("Oops an error occurred, please try again later", classTag: classTag));
    }
  }
}
