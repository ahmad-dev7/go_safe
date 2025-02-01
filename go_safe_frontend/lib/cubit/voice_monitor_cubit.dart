import 'package:flutter_bloc/flutter_bloc.dart';

class VoiceMonitorCubit extends Cubit<VoiceMonitorState> {
  VoiceMonitorCubit() : super(VoiceMonitorDisabled());

  updateVoiceMonitorState(bool isEnable) {
    if (isEnable) {
      emit(VoiceMonitorEnabled());
    } else {
      emit(VoiceMonitorDisabled());
    }
  }
}

abstract class VoiceMonitorState {}

class VoiceMonitorEnabled extends VoiceMonitorState {}

class VoiceMonitorDisabled extends VoiceMonitorState {}
