import 'dart:convert';
import 'package:bacancy/infra/model/data.dart';
import 'package:http/http.dart' as http;




class ApiCall {
  Future<List<dynamic>>fetchData() async {
    try {
      Map<String, String> header = {
        'Authorization': 'Bearer 0d3d9c3c9a4599d3cef1b52404bfd276763cf602'
      };
      print('header $header');
      final response = await http.get(
          Uri.parse('https://api.todoist.com/rest/v1/projects'),
          headers: header);
      var data = json.decode(response.body);

      print('data $data');
     return  data as List;
    } on Exception catch (e) {
      print('Excepion in network caall$e');
      return [];
    }
    // List <Data> payload = jsonResults.map((e) => Data.fromJson(e)).toList();
    // print(' list$payload');


  }
}
