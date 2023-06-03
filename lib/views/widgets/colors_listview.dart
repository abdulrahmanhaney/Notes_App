import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import '../../constants.dart';
import 'color_item.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int curruntIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              curruntIndex = index;
              BlocProvider.of<AddNoteCubit>(context).currentcolor =
                  kcolorsList[index];
              setState(() {});
            },
            child: ColorItem(
              color: kcolorsList[index],
              isActive: index == curruntIndex ? true : false,
            ),
          ),
        ),
        itemCount: kcolorsList.length,
      ),
    );
  }
}
