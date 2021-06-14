import 'package:bacancy/infra/model/data.dart';
import 'package:bacancy/infra/repo/bacancy_repo.dart';
import 'file:///D:/AndroidProject/bacancy/lib/infra/network/api_call.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bacancy_state.dart';

class BacancyCubit extends Cubit<BacancyState> {
  final BacancyRepo bacancyRepo;
  BacancyCubit({this.bacancyRepo}) : super(BacancyInitial());

  void fetchData()async{
    try{
      bacancyRepo.fetchData().then((data) {
        emit(BacancyLoaded(data: data));
      });


    }catch(e){
      print('in cubit $e');
    }
  }





}
