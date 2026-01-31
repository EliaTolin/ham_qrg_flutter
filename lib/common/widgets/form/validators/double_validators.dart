String? doubleValidator(String? value, bool isRequired) {
  if (isRequired && (value == null || value == '')) {
    return 'Campo obbligatorio';
  }
  if (value != null && value.isNotEmpty) {
    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Inserire un numero valido';
    }
  }
  return null;
}
