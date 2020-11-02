import 'package:flutter/widgets.dart';

class PreviewLayout extends StatelessWidget {
  const PreviewLayout({Key key, this.children, this.portraitOrientation, this.needsScroll}) : super(key: key);

  final List<Widget> children;
  final bool portraitOrientation, needsScroll;

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: portraitOrientation ? 0.94 : 0.9,
        heightFactor: portraitOrientation ? 1 : 0.9, // TODO Fix height on small screen.
        child: _ScrollChild(
          scroll: needsScroll || portraitOrientation,
          child: portraitOrientation
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [const SizedBox(height: 20), ...children])
              : Row(
                  textBaseline: TextBaseline.ideographic,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: children),
        ),
      );
}

class _ScrollChild extends StatelessWidget {
  final bool scroll;
  final Widget child;
  const _ScrollChild({Key key, this.scroll, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) => scroll ? SingleChildScrollView(child: child) : SizedBox(child: child);
}
