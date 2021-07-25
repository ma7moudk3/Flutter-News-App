import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  final bool condition;
  final Function fallback;
  final Function builder;

  ConditionalBuilder({
    @required this.condition,
    @required this.builder,
    @required this.fallback,
  })  : assert(condition != null),
        assert(builder != null),
        assert(fallback != null);

  @override
  Widget build(BuildContext ctx) => condition ? builder(ctx) : fallback(ctx);
}
