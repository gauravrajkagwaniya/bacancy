import 'package:bacancy/infra/model/data.dart';
import 'package:bacancy/infra/network/api_call.dart';

class BacancyRepo {
  final ApiCall apiCall;

  BacancyRepo({this.apiCall});

 Future<List<Data>>fetchData() async{
   final dataRaw = await apiCall.fetchData();
   print('in repo');
   return dataRaw.map((e) => Data.fromJson(e)).toList();

 }
}