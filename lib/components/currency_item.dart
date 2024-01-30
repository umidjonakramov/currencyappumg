import 'package:currencyappumg/data/source/pref/sharedPreferences.dart';
import 'package:currencyappumg/data/source/pref/sharedPreferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/source/model/response/currency_model.dart';
import '../lang/locale_keys.g.dart';

Widget CurrencyItem2(
  CurrencyModel currencyModel,
  void Function(CurrencyModel currencyModel) onCalculate,
) {
  return /*GestureDetector(
    onTap: () {},
    child:*/ Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        color: Color(0xFFFFFFFF),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (MyPreference.getLang() == 'en')
                    Text(
                      currencyModel.ccyNmEn ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  else if (MyPreference.getLang() == 'ru')
                    Text(
                      currencyModel.ccyNmRu  ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  else
                    Text(
                      currencyModel.ccyNmUz ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  const SizedBox(width: 12),
                  Text(
                    currencyModel.diff ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '1 ${currencyModel.ccy} => ${currencyModel.rate} UZS |',
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                  ),
                  const SizedBox(width: 12),
                  Text(
                  '📆${currencyModel.date}',
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 6),
                  child: InkWell(
                    onTap: () {
                      onCalculate(currencyModel);
                    },
                    child: Container(
                      // height: 28,
                      padding: EdgeInsets.all(6),
                      // width: 100,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calculate_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            LocaleKeys.calculate.tr(),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ),
                )
              ],
            )
          ],
        ));
}
