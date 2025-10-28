import '../model/age_model.dart';

class AgeController {
  String processAgeInput(String dayInput, String monthInput, String yearInput) {
    if (dayInput.isEmpty || monthInput.isEmpty || yearInput.isEmpty) {
      return 'Please fill in all fields.';
    }

    final dayBirth = int.tryParse(dayInput);
    final monthBirth = int.tryParse(monthInput);
    final yearBirth = int.tryParse(yearInput);

    if (dayBirth == null || monthBirth == null || yearBirth == null) {
      return 'Invalid input. Please enter valid numbers for day, month, and year.';
    }

    if (dayBirth < 1 ||
        dayBirth > 31 ||
        monthBirth < 1 ||
        monthBirth > 12 ||
        yearBirth < 1900 ||
        yearBirth > DateTime.now().year) {
      return 'Please enter a valid date.';
    }

    final ageData = AgeModel.calculateAge(dayBirth, monthBirth, yearBirth);

    return 'You are ${ageData['years']} years, ${ageData['months']} months and ${ageData['days']} days.';
  }
}
