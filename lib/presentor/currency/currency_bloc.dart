import 'dart:async';

import 'package:currencyappumg/data/source/remote/api_service_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/currency_repository_impl.dart';
import '../../data/source/model/response/currency_model.dart';
import '../../data/source/remote/api_service.dart';
import '../../main.dart';
import '../../status.dart';

part 'currency_event.dart';

part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyState()) {
    on<InitialCurrencyEvent>((event, emit) async {
      emit(state.copyWith(status: Status.LOADING));
      final repository = CurrencyRepositoryImpl();
      try {
        final data = await repository.getCurrency();
        emit(state.copyWith(status: Status.SUCCESS, data: data));
      } catch (e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });
    on<UpdateEvent>((event, emit) async {
      final apiService = ApiServiceImpl();
      try {
        final date = event.date;
        if (date != null) {
          emit(state.copyWith(status: Status.LOADING));
          final data = await apiService.getCurrencyByDate(
              apiService.formatDate(date.first ?? DateTime.now()));
          emit(state.copyWith(status: Status.SUCCESS, data: data));
        }
      } catch (e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });

  }

}
