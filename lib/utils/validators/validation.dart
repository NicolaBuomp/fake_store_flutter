class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
      if(value== null || value.isEmpty){
        return '$fieldName è obbligatorio';
      }
      return null;
}

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at last 6 characters long.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'La password deve avere almeno un carattere MAIUSCOLO.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'La password deve avere almeno un numero.';
    }

    if (!value.contains(RegExp(r'[!@#$%&*(),.?":{}|<>]'))) {
      return 'La password deve avere almeno un carattere speciale.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Numberi di telefono obbligatorio.';
    }

    // final phonrRegExp = RegExp(r'^\d{10$}');
    //
    // if (!phonrRegExp.hasMatch(value)) {
    //   return 'Numero di telefono non valido.';
    // }

    return null;
  }
}
