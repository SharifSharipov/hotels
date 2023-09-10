import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotels/data/models/booking_model/booking_model.dart';
import 'package:hotels/data/models/hotel_model/hotel_model.dart';
import 'package:hotels/data/models/number_model/rooms_model.dart';
import 'package:hotels/data/repository/storage_repositroy/storage_repository.dart';
import 'package:hotels/data/unversaldata/unversaldata.dart';
import 'package:hotels/utils/constanta/constants.dart';


class ApiService {
  final _dio = Dio(
    BaseOptions(
      //baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ApiService() {
    _init();
  }

  _init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint("ОШИБКА ПОПАДАНИЯ:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("ЗАПРОС ОТПРАВЛЕН :${requestOptions.path}");
          requestOptions.headers
              .addAll({"token": StorageRepository.getString("token")});
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("ОТВЕТ ПРИШЕЛ :${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getUserModel() async {
    Response response;
    try {
      response = await Dio()
          .get('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3');

      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: HotelModel.fromJson(response.data));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data["message"]);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getWebsiteById(int id) async {
    Response response;
    try {
      response = await _dio.get(
          'https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd?id=$id');
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        List<Rooms> rooms = (response.data['rooms'] as List)
            .map((roomData) => Rooms.fromJson(roomData))
            .toList();
        return UniversalData(data: rooms);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
  Future<UniversalData> getBooking() async {
    Response response;
    try {
      response = await Dio()
          .get('https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8');

      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: BookingModel.fromJson(response.data));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data["message"]);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}

UniversalData getDioCustomError(DioException exception) {
  debugPrint("DIO ERROR TYPE: ${exception.type}");
  if (exception.response != null) {
    return UniversalData(error: exception.response!.data["message"]);
  }
  switch (exception.type) {
    case DioExceptionType.sendTimeout:
      {
        return UniversalData(error: "sendTimeout");
      }
    case DioExceptionType.receiveTimeout:
      {
        return UniversalData(error: "receiveTimeout");
      }
    case DioExceptionType.cancel:
      {
        return UniversalData(error: "cancel");
      }
    case DioExceptionType.badCertificate:
      {
        return UniversalData(error: "badCertificate");
      }
    case DioExceptionType.badResponse:
      {
        return UniversalData(error: "badResponse");
      }
    case DioExceptionType.connectionError:
      {
        return UniversalData(error: "connectionError");
      }
    case DioExceptionType.connectionTimeout:
      {
        return UniversalData(error: "connectionTimeout");
      }
    default:
      {
        return UniversalData(error: "unknown");
      }
  }
}
