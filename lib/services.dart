

import 'dart:async';
import 'dart:io';
import 'model_class.dart';
import 'package:http/http.dart' as http;

class  ServicesApi{
  ServicesApi._();

  static var time_out=const Duration(seconds: 10);
  static var client=http.Client();
  static var url='https://jsonplaceholder.typicode.com/albums';



  static Future<List<ModelFakeApi>> GetTODOS() async
  {
    try {
      var response = await client.get(Uri.parse(url)).timeout(time_out);

      if (response.statusCode == 200) {
        final modelFakeApi=modelFakeApiFromJson(response.body);
        return modelFakeApi;
      }
      else {
        print("Sorry error occures ${response.statusCode},${response.body}");
        return null!;
      }
    } on TimeoutException catch(_){
      print("Timeout  Error");
      return null!;

    }
    on SocketException{
      print("intenet Error");
      return null!;
    }
    catch(ex)
    {
      print("Error: ${ex.toString()}");
      return null!;
    }
  }


}