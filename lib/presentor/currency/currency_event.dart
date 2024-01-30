part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent {}

class InitialCurrencyEvent extends CurrencyEvent{}

class DateEvent extends CurrencyEvent{
  
}