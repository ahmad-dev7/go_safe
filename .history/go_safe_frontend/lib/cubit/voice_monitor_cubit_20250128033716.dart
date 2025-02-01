import 'package:flutter_bloc/flutter_bloc.dart';

class VoiceMonitorCubit extends Cubit<VoiceMonitorState> {
  VoiceMonitorCubit() : super(VoiceMonitorDisabled());
}

abstract class VoiceMonitorState {}

class VoiceMonitorEnabled extends VoiceMonitorState {}

class VoiceMonitorDisabled extends VoiceMonitorState {}
