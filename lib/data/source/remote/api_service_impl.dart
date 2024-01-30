import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../model/response/currency_model.dart';
import 'api_service.dart';

class ApiServiceImpl extends ApiService{
  final _dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://cbu.uz',
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
     // headers: {'Bearer token':'srafsfasrfgrsagdrhrther654r5h4d'},
    //    queryParameters: {'dfsd':'sdfds'}
    )
  );

  String formatDate(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    // Format the DateTime object using the formatter
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }


Future<List<CurrencyModel>> getCurrency(String lang) async {
  try {
    //dio.options.headers['gs'] = 'ssfdg';
    final response = await _dio.get('/uz/arkhiv-kursov-valyut/json/',);
    return (response.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
  } on DioException catch(e){
    return  [];
  }
}
  Future<List<CurrencyModel>> getCurrencyByDate(String date) async {
    try {
      final response =
      await _dio.get('/uz/arkhiv-kursov-valyut/json/all/$date/');
      return (response.data as List)
          .map((e) => CurrencyModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      return [];
    }
  }





}