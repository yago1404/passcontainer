abstract class ValidatorsUtil {
  static String? emailValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      List<String> emailComponents = value.split('@');
      if (emailComponents.length == 2 && emailComponents[1].contains('.')) {
        return null;
      }
      return 'E-mail inválido';
    }
    return 'Campo e-mail é obrigatório';
  }

  static String? noNullable(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}