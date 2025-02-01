import 'package:flutter_bloc/flutter_bloc.dart';

class VoiceMonitorCubit extends Cubit<VoiceMonitorState> {
  VoiceMonitorCubit() : super(VoiceMonitorDisabled());

  updateVoiceMonitorState() {
    if (state is VoiceMonitorDisabled) {
      emit(VoiceMonitorEnabled());
    }
    if (state is VoiceMonitorEnabled) {
      emit(VoiceMonitorDisabled());
    }
  }
}

abstract class VoiceMonitorState {}

class VoiceMonitorEnabled extends VoiceMonitorState {}

class VoiceMonitorDisabled extends VoiceMonitorState {}
