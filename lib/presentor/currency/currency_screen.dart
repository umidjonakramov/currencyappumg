import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:currencyappumg/data/source/pref/sharedPreferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/currency_item.dart';
import '../../components/text_field.dart';
import '../../lang/locale_keys.g.dart';
import '../../main.dart';
import '../../status.dart';
import 'currency_bloc.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final bloc = CurrencyBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  var _controllerV1 = TextEditingController();

  @override
  void initState() {
    bloc.add(InitialCurrencyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<CurrencyBloc, CurrencyState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == Status.LOADING) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (state.status == Status.SUCCESS) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.currency.tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(children: [
                      InkWell(
                        onTap: () async {
                          await showCalendarDatePicker2Dialog(
                            context: context,
                            config: CalendarDatePicker2WithActionButtonsConfig(
                              lastDate: DateTime.now(),
                            ),
                            dialogSize: const Size(325, 400),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: InkWell(
                            onTap: () async {
                              context.read<CurrencyBloc>().add(UpdateEvent(
                                      await showCalendarDatePicker2Dialog(
                                    context: context,
                                    config:
                                        CalendarDatePicker2WithActionButtonsConfig(
                                      lastDate: DateTime.now(),
                                    ),
                                    dialogSize: const Size(325, 400),
                                  )));
                            },
                            child: const Icon(
                              Icons.date_range_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isDismissible: false,
                              builder: (context) => Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              MyPreference.setLang("uz");
                                              Navigator.pop(context);
                                              await context.setLocale(
                                                  const Locale("uz"));
                                            },
                                            child: Text(LocaleKeys.uzbek.tr())),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              MyPreference.setLang("en");
                                              await context.setLocale(
                                                  const Locale("en"));
                                              Navigator.pop(context);
                                            },
                                            child:
                                                Text(LocaleKeys.english.tr())),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              MyPreference.setLang("ru");
                                              await context.setLocale(
                                                  const Locale("ru"));
                                              Navigator.pop(context);
                                            },
                                            child:
                                                Text(LocaleKeys.russian.tr())),
                                      ],
                                    ),
                                  ));
                        },
                      )
                    ])
                  ],
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.data?.length,
                          itemBuilder: (context, index) {
                            return CurrencyItem2(state.data![index],
                                (currencyModel) {
                              showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  builder: (context) => Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        width: double.infinity,
                                        height: 300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(16),
                                                child: InputText(
                                                    state.data![index].ccy ??
                                                        "",
                                                    TextInputType.number,
                                                    _controllerV1,
                                                    '')),
                                            Container(
                                                padding: EdgeInsets.all(16),
                                                child: Text(
                                                  '${stringToDouble(_controllerV1.text) * double.parse(state.data![index].rate ?? "")} so`m',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                          ],
                                        ),
                                      )));
                            });
                          }),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Placeholder(),
            );
          }
        },
      ),
    );
  }
}

double stringToDouble(String text) {
  return double.tryParse(text) ?? 0.0;
}
