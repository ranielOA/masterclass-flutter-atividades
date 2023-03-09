import 'package:atividade2/Person.dart';

void main() {
  Person person = Person(name: "Raniel", cpf: "809.805.840-94");

  if (person.isCPFValid()) {
    print(person.describePerson());
  } else {
    print('CPF Inválido');
  }
}
