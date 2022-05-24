import 'package:responsive/logic.dart';

class ResponsiveEndpoints {
  static bool isMobile(double width) {
    return Responsive.gridSize(width) == Responsive.sm ||
        Responsive.gridSize(width) == Responsive.md;
  }

  static bool isDesktop(double width) {
    return Responsive.gridSize(width) != Responsive.sm &&
        Responsive.gridSize(width) != Responsive.md;
  }
}