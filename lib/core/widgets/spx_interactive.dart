import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shared feedback for custom navigation controls without changing their size.
class SpxInteractive extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final HitTestBehavior behavior;

  const SpxInteractive({
    super.key,
    required this.child,
    this.onTap,
    this.behavior = HitTestBehavior.opaque,
  });

  @override
  State<SpxInteractive> createState() => _SpxInteractiveState();
}

class _SpxInteractiveState extends State<SpxInteractive> {
  bool _hovered = false;
  bool _focused = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    return FocusableActionDetector(
      enabled: enabled,
      mouseCursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      onShowHoverHighlight: (value) => setState(() => _hovered = value),
      onShowFocusHighlight: (value) => setState(() => _focused = value),
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
      },
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) {
          widget.onTap?.call();
          return null;
        }),
      },
      child: Semantics(
        button: enabled,
        child: GestureDetector(
          behavior: widget.behavior,
          onTap: widget.onTap,
          onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
          onTapUp: enabled ? (_) => setState(() => _pressed = false) : null,
          onTapCancel: enabled ? () => setState(() => _pressed = false) : null,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              widget.child,
              Positioned.fill(
                child: IgnorePointer(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 140),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: enabled && (_hovered || _focused || _pressed)
                          ? Colors.black
                              .withValues(alpha: _pressed ? 0.12 : 0.06)
                          : Colors.transparent,
                      border: _focused && enabled
                          ? Border.all(color: const Color(0xFFEE4D2D), width: 2)
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
