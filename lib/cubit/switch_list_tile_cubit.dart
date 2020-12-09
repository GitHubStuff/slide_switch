import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'switch_list_tile_state.dart';

class SwitchListTileCubit extends Cubit<SwitchListTileState> {
  String get _root => 'com.icodeforyou.SlideSwitchWidget.$preferenceKey';
  final String preferenceKey;
  SwitchListTileCubit(this.preferenceKey) : super(SwitchListTileInitial());

  void getCurrentState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool state = prefs.getBool(_root) ?? false;
    emit(GetSwitchState(state));
  }

  void setCurrentState(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_root, state);
    emit(TriggerCallback(state));
  }
}
