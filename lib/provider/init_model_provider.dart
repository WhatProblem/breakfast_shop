import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<A extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, A model, Widget child) builder;
  final A model;
  final Widget child;
  final Function(A) onModelReay;

  ProviderWidget(
      {Key key,
      @required this.builder,
      @required this.model,
      this.child,
      this.onModelReay})
      : super(key: key);

  @override
  _ProviderWidgetState<A> createState() => _ProviderWidgetState<A>();
}

class _ProviderWidgetState<A extends ChangeNotifier>
    extends State<ProviderWidget<A>> {
  A model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReay != null) {
      widget.onModelReay(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<A>(
          builder: (context) => model,
        )
      ],
      child: Consumer<A>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
