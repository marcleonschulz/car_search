import 'package:car_search/shared/models/car.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = "https://api.marc-schulz.tech";

  Car car = Car();
  getCar({required String hsn,required String tsn}){
    if (hsn != "" && tsn != ""){
      return fetcher(url: '$_baseUrl/search-$hsn-$tsn');
    } else if (hsn != "" && tsn == ""){
      return fetcher(url: '$_baseUrl/hsn-search-$hsn');
    } else {
      car.error = "Sie können nichts nichts suchen";
      return car;
    }

    
  }

  fetcher({required url}) async {
    try {

      // Perform GET request to the endpoint "/users/<hsn-tsn>"
      Response carData = await _dio.get(url);

      // Prints the raw data returned by the server
      print('Car Info: ${carData.data}');

      // Parsing the raw JSON data to the User class
      Car car = Car.fromJson(carData.data);

      return car;
    } on DioError catch (e){
      if (e.response != null) {
        car.error = "Es gibt ein network error!";
        return  car;
      } else{
        car.error = e.message;
        return  car;
      }
    }
  }
}