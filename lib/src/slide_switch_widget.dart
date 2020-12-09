import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_switch/cubit/switch_list_tile_cubit.dart';

class SlideSwitchWidget extends StatelessWidget {
  final Widget trueCaption;
  final Widget trueIcon;
  final Widget falseCaption;
  final Widget falseIcon;
  final String tag;
  final Function(String, bool) callback;
  final bool initialState;
  const SlideSwitchWidget({
    @required this.tag,
    @required this.trueCaption,
    @required this.callback,
    this.trueIcon,
    this.falseCaption,
    this.falseIcon,
    this.initialState = false,
  })  : assert(tag != null),
        assert(callback != null),
        assert(trueCaption != null);
  @override
  Widget build(BuildContext context) {
    final cubit = SwitchListTileCubit(tag);
    bool currentState = initialState ?? false;
    return BlocBuilder<SwitchListTileCubit, SwitchListTileState>(
        cubit: cubit,
        builder: (context, widgetState) {
          switch (widgetState.switchListTileStateType) {
            case SwitchListTileStateType.GetSwitchState:
              currentState = (widgetState as GetSwitchState).state;
              break;
            case SwitchListTileStateType.SwitchListTileInitial:
              cubit.getCurrentState();
              return Container();
              break;
            case SwitchListTileStateType.TriggerCallback:
              currentState = (widgetState as TriggerCallback).state;
              callback(tag, currentState);
          }
          return SwitchListTile(
            title: currentState ? trueCaption : (falseCaption ?? trueCaption),
            value: currentState,
            secondary: currentState ? trueIcon : (falseIcon ?? trueIcon),
            onChanged: (value) => cubit.setCurrentState(value),
          );
        });
  }
}
