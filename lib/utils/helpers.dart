class Helpers {
  static double parseAmount(String text) {
    try {
      return double.parse(text);
    } catch (e) {
      return 0.0;
    }
  }
}

String formatCurrency(double amount) {
  return "\$${amount.toStringAsFixed(2)}";
}
