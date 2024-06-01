import 'package:ud_design/ud_design.dart';

extension DoubleExtensions on double {
  double get pt => UdDesign.pt(this);
  double get sp => UdDesign.fontSize(this);
}

extension IntExtensions on int {
  double get pt => UdDesign.pt(double.parse("$this"));
  double get sp => UdDesign.fontSize(double.parse("$this"));
}
