import 'dart:ui';

abstract class ColorUtils {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String toHex(Map<String, dynamic> colorObject,
      {bool leadingHashSign = false}) {
    Color color = toColor(colorObject);

    return '${leadingHashSign ? '#' : ''}'
        '${color.red.toRadixString(16).padLeft(2, '0')}'
        '${color.green.toRadixString(16).padLeft(2, '0')}'
        '${color.blue.toRadixString(16).padLeft(2, '0')}'
        '${color.alpha.toRadixString(16).padLeft(2, '0')}';
  }

  static Color toColor(Map<String, dynamic> color) => Color.fromRGBO(
        color['R'],
        color['G'],
        color['B'],
        color['O'] == null ? 1 : color['O']!.toDouble(),
      );
}
