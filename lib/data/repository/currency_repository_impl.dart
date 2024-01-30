

import 'package:currencyappumg/data/source/pref/sharedPreferences.dart';

import '../source/model/response/currency_model.dart';
import '../source/remote/api_service_impl.dart';
import 'currency_repository.dart';

class CurrencyRepositoryImpl extends CurrencyRepository{
  final apiService = ApiServiceImpl();
  @override
  Future<List<CurrencyModel>> getCurrency() async {
    final result = await apiService.getCurrency(MyPreference.getLang() ?? "uz");
    return result;
  }
}