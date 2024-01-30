
import '../model/response/currency_model.dart';

abstract class ApiService{
  Future<List<CurrencyModel>> getCurrency(String lang);
  Future<List<CurrencyModel>> getCurrencyByDate(String date);
  String formatDate(DateTime dateTime);

}