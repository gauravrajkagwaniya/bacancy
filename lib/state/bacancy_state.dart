part of 'bacancy_cubit.dart';

@immutable
abstract class BacancyState {
  const  BacancyState();
}

class BacancyInitial extends BacancyState {
  const BacancyInitial();
}

class BacancyLoaded extends BacancyState{
  final List<Data> data;

  BacancyLoaded({this.data});


}