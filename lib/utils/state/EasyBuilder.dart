import 'package:flutter/material.dart';
import 'Easy.dart';

class EasyBuilder<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(T logic) builder;
  final String? tag;
  final bool autoRemove;

  const EasyBuilder({
    Key? key,
    required this.builder,
    this.autoRemove = true,
    this.tag,
  }) : super(key: key);

  @override
  _EasyBuilderState<T> createState() => _EasyBuilderState<T>();
}

class _EasyBuilderState<T extends ChangeNotifier> extends State<EasyBuilder<T>> {
  late T controller;

  @override
  void initState() {
    super.initState();

    ///此处是整个类的灵魂代码
    controller = Easy.find<T>(tag: widget.tag);
    controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.autoRemove) {
      Easy.delete<T>(tag: widget.tag);
    }
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(controller);
}