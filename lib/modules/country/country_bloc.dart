import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../data/models/country_model.dart';

class CountryBloc {
  Future<List<Country>?> getCountries() async {
    try {
      var response = await Dio().get('https://api.first.org/data/v1/countries');
      // log(response.data);
      final countryData = <Country>[];
      Map<String, dynamic> data = response.data['data'];

      data.keys.forEach(
        ((element) => countryData.add(
              Country(
                  code: element,
                  country: data[element]['country'],
                  region: data[element]['region']),
            )),
      );
      log(data.toString());
      return countryData;
    } on DioError catch (e) {
      if (e.message.contains('SocketException')) {
        return Future.error('Please check your network connectivity');
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }
}
