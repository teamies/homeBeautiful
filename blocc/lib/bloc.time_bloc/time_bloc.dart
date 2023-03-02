import 'dart:async';

import 'package:blocc/bloc.time_bloc/time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TimeBloc extends Bloc<TimeEvent, TimeState>{
  TimeBloc(TimeState initialState): super(initialState);


  static int _timeDuration = 60;
  StreamSubscription<int> _timeSupscription ;

  @override
  Stream<TimeState> mapEventToState(TimeEvent event){
    if(event is StartEvent){

    }
  }
}