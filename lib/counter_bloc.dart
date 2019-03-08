import 'dart:async';

import 'package:sample_app/count_provider.dart';
abstract class BaseBloc{
  void dispose();
}

class CounterBloc implements BaseBloc{

  final countProvider =CountProvider(); // custom class to increment count
  
  var sController =StreamController<int>();
  StreamSink<int> get counter => sController.sink;  // used for input of data.
  Stream<int> get counterOutput => sController.stream;  // used for output of data.


  updateCounter(){
    countProvider.increaseCount();
    counter.add(countProvider.count);  // adds the data to the sink/input.
  }
  
  
  @override
  void dispose() {
    sController.close();  //to avoid memory leaks.
  }

}