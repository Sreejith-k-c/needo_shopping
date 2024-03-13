import 'package:http/http.dart'as http;
import 'package:needo_shopping/model/api_model.dart';

class NeedoService {
  static Future<ModelApi>fetchProducts() async {
    var response = await http.get(Uri.parse("https://test.needoo.in/calculate_distance/9785641253/10.9916/76.0103/"));
    if(response.statusCode == 200) {
      var data=response.body;
      return modelApiFromJson(data);
    }else{
      throw Exception();
    }
  }
}