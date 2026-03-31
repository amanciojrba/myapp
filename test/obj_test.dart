import 'package:flutter_test/flutter_test.dart';

abstract class Pessoa {
 late int _id;
 String nome;

 Pessoa(this.nome);
 

 int get id => _id;

 set id(int id) {
   if (id > 0) {
     _id = id;
   } else {
     throw ArgumentError('Identificador deve ser não negativo.');
   }
 }
}
class Professor extends Pessoa {
  Professor(String nome) : super("Professor $nome");
}
mixin Ano {
  late int _ano;
  int get ano => _ano;
  set ano(int ano) {
    if (ano > 0) {
      _ano = ano;
    } else {
      throw ArgumentError('Ano deve ser não negativo.');
    }
  }
}

class Aluno extends Pessoa with Ano {
  Aluno(super.nome, int ano) {
    this.ano = ano;
  }
}

class Disciplina {
  String nome;
  Disciplina(this.nome);
}

class Turma with Ano {
  Disciplina disciplina;
  Professor professor; 
  final List<Aluno> _alunos = [];

  Turma(this.disciplina, this.professor, int ano) {
    this.ano = ano;
  }

  void matricular(Aluno aluno) {
    if (aluno.ano == ano) {
      _alunos.add(aluno);
    } else {
      throw ArgumentError('Ano deve ser o mesmo.');
    }
  }
}

class Historico extends Turma {
  Map<Aluno, List<double>> notas = {};

  Historico(super.disciplina, super.professor, super.ano);

  @override
  void matricular(Aluno aluno) {
    super.matricular(aluno);
    notas[aluno] = [];
  }

  double media(Aluno aluno) {
    if (!notas.containsKey(aluno) || notas[aluno]!.isEmpty) return 0.0;
    double soma = 0;
    for (double nota in notas[aluno]!) {
      soma += nota;
    }
    return soma / notas[aluno]!.length;
  }

  bool isAprovado(Aluno aluno) {
    return media(aluno) > 6.0;
  }
}

void main() {
  test('Testar matrícula e aprovação', () {
    Disciplina disciplina1 = Disciplina('Flutter');
    Professor prof1 = Professor('Amâncio'); 
    Historico historico1 = Historico(disciplina1, prof1, 2026);

    Aluno aluno1 = Aluno('Maria', 2026);
    aluno1.id = 1;
    historico1.matricular(aluno1);

    historico1.notas[aluno1] = [8.0, 7.0]; 
    
    expect(historico1.isAprovado(aluno1), isTrue);
    print('Professor: ${historico1.professor.nome}');
    print('Aluno aprovado: ${historico1.isAprovado(aluno1)}');
  });
}
mixin Ano {
  late int _ano;
  int get ano => _ano;
  set ano(int ano) {
    if (ano > 0) {
      _ano = ano;
    } else {
      throw ArgumentError('Ano deve ser não negativo.'); 
    }
  }
}

class Aluno extends Pessoa with Ano {
  Aluno(super.nome, int ano) {
    this.ano = ano;
  }
}

class Disciplina {
  String nome;
  Disciplina(this.nome);
}

class Turma with Ano {
  Disciplina disciplina;
  Professor professor; 
  final List<Aluno> _alunos = [];

  Turma(this.disciplina, this.professor, int ano) {
    this.ano = ano;
  }

  void matricular(Aluno aluno) {
    if (aluno.ano == ano) {
      _alunos.add(aluno);
    } else {
      throw ArgumentError('Ano deve ser o mesmo.'); 
    }
  }
}

class Historico extends Turma {
  Map<Aluno, List<double>> notas = {};

  Historico(super.disciplina, super.professor, super.ano);

  @override
  void matricular(Aluno aluno) {
    super.matricular(aluno);
    notas[aluno] = [];
  }

  double media(Aluno aluno) {
    if (!notas.containsKey(aluno) || notas[aluno]!.isEmpty) return 0.0;
    double soma = 0;
    for (double nota in notas[aluno]!) {
      soma += nota;
    }
    return soma / notas[aluno]!.length;
  }

  bool isAprovado(Aluno aluno) {
    return media(aluno) > 6.0;
  }
}

void main() {
  test('Testar matrícula e nome do Professor', () {
    Disciplina disciplina1 = Disciplina('Flutter');
    
    Professor prof1 = Professor(' Amâncio'); 
    
    Historico historico1 = Historico(disciplina1, prof1, 2026);
    print('Nome do mestre: ${historico1.professor.nome}'); 

    Aluno aluno1 = Aluno('Maria', 2026);
    aluno1.id = 1;
    historico1.matricular(aluno1);

    // 6 - Testando a lógica de aprovação [cite: 12]
    historico1.notas[aluno1] = [8.5, 7.0]; 
    
    expect(historico1.isAprovado(aluno1), isTrue);
    expect(historico1.professor.nome, contains('Professor'));
  });
}
