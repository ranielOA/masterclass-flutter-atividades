class Person {
  final String _name;
  final String _cpf;

  Person({required String name, required String cpf})
      : _name = name,
        _cpf = cpf;

  bool isCPFValid() {
    String cpf = _cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (cpf.length != 11) {
      return false;
    }

    int sumDigit1 = 0;
    int sumDigit2 = 0;
    int currNumber = 2;
    for (var rune in cpf.substring(0, 10).split('').reversed.join().runes) {
      int currDigit = int.parse(String.fromCharCode(rune));

      if (currNumber > 2) {
        sumDigit1 += currDigit * (currNumber - 1);
      }
      sumDigit2 += currDigit * currNumber;

      currNumber++;
    }

    int restDigit1 = sumDigit1 % 11;
    int restDigit2 = sumDigit2 % 11;

    restDigit1 = restDigit1 < 2 ? 0 : 11 - restDigit1;
    restDigit2 = restDigit2 < 2 ? 0 : 11 - restDigit2;

    return restDigit1 == int.parse(cpf[9]) && restDigit2 == int.parse(cpf[10]);
  }

  String describePerson() {
    return "Nome: $_name, CPF: $_cpf";
  }
}
