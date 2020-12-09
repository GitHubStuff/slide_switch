part of 'switch_list_tile_cubit.dart';

enum SwitchListTileStateType {
  SwitchListTileInitial,
  GetSwitchState,
  TriggerCallback,
}

@immutable
abstract class SwitchListTileState extends Equatable {
  final switchListTileStateType;
  const SwitchListTileState(this.switchListTileStateType);
  @override
  List<Object> get props => [switchListTileStateType];
}

class SwitchListTileInitial extends SwitchListTileState {
  const SwitchListTileInitial() : super(SwitchListTileStateType.SwitchListTileInitial);
}

class GetSwitchState extends SwitchListTileState {
  final bool state;
  const GetSwitchState(this.state) : super(SwitchListTileStateType.GetSwitchState);
  @override
  List<Object> get props => [state, switchListTileStateType];
}

class TriggerCallback extends SwitchListTileState {
  final bool state;
  const TriggerCallback(this.state) : super(SwitchListTileStateType.TriggerCallback);
  @override
  List<Object> get props => [state, switchListTileStateType];
}
