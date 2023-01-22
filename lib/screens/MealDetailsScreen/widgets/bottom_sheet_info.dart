import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BottomInfoSheet extends StatefulWidget {
  final List<Widget> child;
  final String backdrops;
  final double? minSize;
  const BottomInfoSheet({
    Key? key,
    required this.child,
    required this.backdrops,
    this.minSize,
  }) : super(key: key);

  @override
  State<BottomInfoSheet> createState() => _BottomInfoSheetState();
}

class _BottomInfoSheetState extends State<BottomInfoSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: widget.minSize == null ? 0.65 : widget.minSize!,
          minChildSize: widget.minSize == null ? 0.65 : widget.minSize!,
          maxChildSize: 0.88,
          builder: (context, con) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.backdrops),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 100),
                  child: Container(
                    color: Colors.black87.withOpacity(.7),
                    child: ListView(
                      controller: con,
                      children: widget.child,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
