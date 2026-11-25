import 'dart:ffi';

import 'package:flutter/material.dart';

class SpecificationWidget extends StatefulWidget {
  final Map<String, dynamic> spec;
  const new({super.key, required this.spec});

  @override
  State<SpecificationWidget> createState() => _SpecificationWidgetState();
}

class _SpecificationWidgetState extends State<SpecificationWidget> {
  final ValueNotifier<bool> expanded = ValueNotifier(false);

  // @override
  // void dispose() {
  //       // print('disoseddddddddddddd');
  //   expanded.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final double headder = 60.0;
    final double row = 40.0;
    final double fullSize = headder + widget.spec.length * row + 16;

    return ValueListenableBuilder(
      valueListenable: expanded,

      builder: (context, open, _) {
        // return GestureDetector(
        //   onTap: () => expanded.value = !open,
        //   child:

        return AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          height: open ? fullSize : headder,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),

            child: Column(
              children: [
                SizedBox(
                  height: headder,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Specifications',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Icon(open ? Icons.expand_less : Icons.expand_more),
                        IconButton(
                          onPressed: () => expanded.value = !open,
                          icon: Icon(
                            open ? Icons.expand_less : Icons.expand_more,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ...widget.spec.entries.map(
                  (p) => SizedBox(
                    height: row,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(p.key), Text(p.value)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ),
        );
      },
    );
  }
}
