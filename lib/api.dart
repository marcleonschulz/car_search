import 'package:car_search/models/car.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = "https://api.marc-schulz.tech";

  late Car car;
  getCar({required String hsn,required String tsn}) async {
    try {
      // Perform GET request to the endpoint "/users/<hsn-tsn>"
      Response carData = await _dio.get(_baseUrl + '/search-$hsn-$tsn');

      // Prints the raw data returned by the server
      print('Car Info: ${carData.data}');

      // Parsing the raw JSON data to the User class
      Car car = Car.fromJson(carData.data);

      return car;
    } on DioError catch (e){
      if (e.response != null) {
        car.error = "NO API";
        return  car;
      } else{
        car.error = e.message;
        return  car;
      }
    }
  }
}