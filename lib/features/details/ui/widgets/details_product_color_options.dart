import 'package:flutter/material.dart';

import '../../../../core/theming/app_fonts.dart';
import '../../data/models/product_details_model.dart';
import 'details_color_circle.dart';

class DetailsProductColorOptions extends StatelessWidget {
  const DetailsProductColorOptions({super.key, required this.details});

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    List<Color> colorOptions = _parseColors(details.colors);

    return Row(
      children: [
        Text('Color : ', style: AppFonts.font16DarkMedium),
        Text(
          details.colors != null && details.colors!.isNotEmpty
              ? details.colors!.join(', ')
              : 'Unknown Color',
          style: AppFonts.font14GreyRegular,
        ),
        Spacer(),
        Row(
          children: List.generate(
            colorOptions.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < colorOptions.length - 1 ? 4 : 0,
              ),
              child: DetailsColorCircle(
                circleColor: colorOptions[index],
                selected: index == 0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Color> _parseColors(List<String>? colorList) {
    if (colorList == null || colorList.isEmpty) {
      return [
        Colors.redAccent,
        Colors.blueAccent,
        Colors.blueGrey,
        Colors.yellow,
        Colors.orange,
        Colors.purple,
        Colors.pink,
        Colors.teal,
        Colors.lime,
        Colors.cyan,
        Colors.indigo,
        Colors.brown,
        Colors.amber,
        Colors.deepOrange,
        Colors.deepPurple,
        Colors.lightBlue,
        Colors.lightGreen,
        Colors.limeAccent,
        Colors.pinkAccent,
        Colors.tealAccent,
        Colors.cyanAccent,
        Colors.indigoAccent,
        Colors.brown,
        Colors.amberAccent,
        Colors.deepOrangeAccent,
        Colors.deepPurpleAccent,
        Colors.lightBlueAccent,
        Colors.lightGreenAccent,
      ];
    }

    List<Color> colors = [];

    for (String colorStr in colorList) {
      String trimmedColor = colorStr.trim();

      if (trimmedColor.startsWith('#')) {
        try {
          String hexCode = trimmedColor.replaceAll('#', '');
          if (hexCode.length == 6) {
            int colorValue = int.parse('0xFF$hexCode');
            colors.add(Color(colorValue));
          } else {
            colors.add(Colors.grey);
          }
        } catch (e) {
          colors.add(Colors.grey);
        }
      } else {
        switch (trimmedColor.toLowerCase()) {
          case 'red':
            colors.add(Colors.red);
            break;
          case 'blue':
            colors.add(Colors.blue);
            break;
          case 'green':
            colors.add(Colors.green);
            break;
          case 'black':
            colors.add(Colors.black);
            break;
          case 'white':
            colors.add(Colors.white);
            break;
          case 'yellow':
            colors.add(Colors.yellow);
            break;
          case 'orange':
            colors.add(Colors.orange);
            break;
          case 'purple':
            colors.add(Colors.purple);
            break;
          case 'pink':
            colors.add(Colors.pink);
            break;
          case 'teal':
            colors.add(Colors.teal);
            break;
          case 'lime':
            colors.add(Colors.lime);
            break;
          case 'cyan':
            colors.add(Colors.cyan);
            break;
          case 'indigo':
            colors.add(Colors.indigo);
            break;
          case 'brown':
            colors.add(Colors.brown);
            break;
          case 'amber':
            colors.add(Colors.amber);
            break;
          case 'deeporange':
            colors.add(Colors.deepOrange);
            break;
          case 'deeppurple':
            colors.add(Colors.deepPurple);
            break;
          case 'lightblue':
            colors.add(Colors.lightBlue);
            break;
          case 'lightgreen':
            colors.add(Colors.lightGreen);
            break;
          case 'limeaccent':
            colors.add(Colors.limeAccent);
            break;
          case 'pinkaccent':
            colors.add(Colors.pinkAccent);
            break;
          case 'tealaccent':
            colors.add(Colors.tealAccent);
            break;
          case 'cyanaccent':
            colors.add(Colors.cyanAccent);
            break;
          case 'indigoaccent':
            colors.add(Colors.indigoAccent);
            break;
          case 'brownaccent':
            colors.add(Colors.brown);
            break;
          case 'amberaccent':
            colors.add(Colors.amberAccent);
            break;
          case 'deeporangeaccent':
            colors.add(Colors.deepOrangeAccent);
            break;
          case 'deeppurpleaccent':
            colors.add(Colors.deepPurpleAccent);
            break;
          case 'lightblueaccent':
            colors.add(Colors.lightBlueAccent);
            break;
          case 'lightgreenaccent':
            colors.add(Colors.lightGreenAccent);
            break;
          default:
            colors.add(Colors.grey);
        }
      }
    }

    return colors;
  }
}
