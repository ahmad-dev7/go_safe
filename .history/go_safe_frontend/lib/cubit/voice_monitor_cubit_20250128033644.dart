import 'package:flutter_bloc/flutter_bloc.dart';

class VoiceMonitorCubit extends Cubit<VoiceMonitorState> {
  VoiceMonitorCubit() : super(VoiceMonitorInitial());
}

abstract class VoiceMonitorState {}

class VoiceMonitorInitial extends VoiceMonitorState {}

class VoiceMonitorEnabled extends VoiceMonitorState {}

class VoiceMonitorDisabled extends VoiceMonitorState {}
