import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Color colorSelected;
  final Function(Color) onSelectColor;
  const ColorPicker(
      {Key? key, required this.colorSelected, required this.onSelectColor})
      : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color> listColors = [
    Colors.red,
    Colors.purple,
    Colors.amber,
    Colors.green,
    Colors.blue
  ];

  Widget renderItemBuilder(BuildContext context, int index) {
    double boxSize = MediaQuery.of(context).size.width / 5 - 20;
    print(listColors[index]);
    return Material(
      color: Colors.transparent,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => {widget.onSelectColor(listColors[index])}, // needed
        child: Ink(
          width: boxSize,
          height: boxSize,
          child: Center(
            child: widget.colorSelected == listColors[index]
                ? Icon(Icons.done, color: Colors.white, size: 30)
                : null,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: listColors[index],
            // boxShadow: [
            //   BoxShadow(color: Colors.green, spreadRadius: 3),
            // ],
          ),
        ),
      ),
    );
  }

  Widget renderListItem(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < listColors.length; i++) {
      list.add(renderItemBuilder(context, i));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: renderListItem(context));
  }
}
