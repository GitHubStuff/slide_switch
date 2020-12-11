# slide_switch

Expands the `SwitchListTile` to include persisted state, true/false captions, true/false icons

## Getting Started

```dart
  class SlideSwitchWidget {
    final String tag;
    final Widget trueCaption;
    final Function(String, bool) callback;
    final Function(String, bool) currentCallback;
    final Widget trueIcon;
    final Widget falseCaption;
    final Widget falseIcon;
    final bool initialState;

    const SlideSwitchWidget({
        @required this.tag,
        @required this.trueCaption,
        @required this.callback,
        this.currentCallback,
        this.trueIcon,
        this.falseCaption,
        this.falseIcon,
        this.initialState = false,
      })  : assert(tag != null),
            assert(callback != null),
            assert(trueCaption != null);
}
```

- `tag` - identifer that is used as a key in the prefence object. Each `tag` in an app must be unique
- `trueCaption` - Widget that will appear when the `SwitchListTile` state is TRUE
- `callback` - returns the `tag` and bool `state` of the `SlideSwitchWidget`
- `currentCallback` - returns initial state of the widget
- `trueIcon` - Widget that appears if state is TRUE. If null displays nothing
- `falseCaption` - Widget that will appear when the `SwitchListTile` state is FALSE. If null `trueCaption` persists
- `falseIcon` - Widget that appears if state is false. If null `trueIcon` persists
- `initalState` - Optional state of what the `SwitchListTile` is created with

## Summary

Be kind to each other
