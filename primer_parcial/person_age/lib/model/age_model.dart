class AgeModel {
  static Map<String, int> calculateAge(
    int dayBirth,
    int monthBirth,
    int yearBirth,
  ) {
    final now = DateTime.now();
    int years = now.year - yearBirth;
    int months = now.month - monthBirth;
    int days = now.day - dayBirth;

    // Si los días son negativos, pedimos prestado del mes anterior
    if (days < 0) {
      final previousMonth = DateTime(
        now.year,
        now.month,
        0,
      ); // último día del mes anterior
      days += previousMonth.day;
      months -= 1;
    }

    // Si los meses son negativos, pedimos prestado del año anterior
    if (months < 0) {
      months += 12;
      years -= 1;
    }

    // Asegurar que los valores nunca sean negativos
    if (years < 0) years = 0;
    if (months < 0) months = 0;
    if (days < 0) days = 0;

    return {'years': years, 'months': months, 'days': days};
  }
}
