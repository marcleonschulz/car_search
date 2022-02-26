import 'package:flutter/cupertino.dart';
import 'package:car_search/shared/models/car.dart';
import 'package:car_search/shared/api.dart';

class CarFetch with ChangeNotifier{
  Car _cars = Car();

  final DioClient _client = DioClient();
  fetcher(String hsn, String tsn)async {
    _cars = await _client.getCar(hsn: hsn, tsn: tsn) as Car;
    notifyListeners();
  }

  Car get cars => _cars;
}