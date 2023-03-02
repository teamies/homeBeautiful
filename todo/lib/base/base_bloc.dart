import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todo/base/base_event.dart';

abstract class BaeBloc{
  StreamController<BaseEvent> _evenStreamControler =StreamController<BaseEvent>();

  BaseBloc(){
    _evenStreamControler.stream.listen((event) {
      if(event is! BaseEvent) { // k phai kie baseEvent
        throw Exception('Event k hop le');
      }

      dispatEvent(event);
    });
  }
  void dispatEvent(BaseEvent event);

  @mustCallSuper
  void dispose(){
    _evenStreamControler.close();
  }
}