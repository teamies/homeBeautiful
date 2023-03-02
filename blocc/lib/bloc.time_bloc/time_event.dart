import 'package:equatable/equatable.dart';

class TimeEvent extends Equatable{
  const TimeEvent();


  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class StartEvent extends TimeEvent{
  final int TimeDuration;
  StartEvent(this.TimeDuration);
}

class RunEvent extends TimeEvent{
  final int TimeDuration;
  RunEvent(this.TimeDuration);
}

class PauseEvent extends TimeEvent{

}

class ResuameEvent extends TimeEvent{

}
class ResetEvent extends TimeEvent{

}