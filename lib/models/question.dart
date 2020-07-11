import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  // defindo os atributos do questionario
  String _id;
  String _bairro; // 1 campo
  int _idade; // >= 18 e < 80
  String _sexo; // 2 opções
  String _escolaridade; // 8 opções
  double _peso; // peso ou 2 opções
  double _altura; // altura ou 2 opções
  double _pesoIdadeVinteAnos; // peso nos 20 anos ou 2 opções
  String _alimentacaoFeijao; // 6 opções
  String _alimentacaoVerduraLegume; // 6 opções
  String _alimentacaoSalada; // 6 opções
  String _lavaFrutaVerdura; // 4 opções
  String _alimentacaoVerduraLegumeCozido; // 6 opções
  String _alimentacaoCarne; // 6 opções
  String _alimentacaoFruta; // 6 opções
  String _alimentacaoDiaFruta; // 3 opções
  String _diaRefrigerante; // 6 opções
  String _diaSuco; // 7 opções
  String _diaAgua; // 7 opções
  String _diaLeite; // 6 opções
  String _frequenciaAlcool; // 7 opções
  String _adicionaSal; // 3 opções
  String _praticouExercicio; // 2 opções
  String _tipoExercicio; // 16 opções
  String _diasExercicio; // 5 opções
  String _tempoExercicio; // 6 opções
  String _trabalhoCaminhada; // 4 opções
  String _trabalhoPeso; // 4 opções
  String _idaTrabalho; // 3 opções
  String _tempoIdaTrabalho; // 4 opções
  String _faxinaCasa; // 3 opções
  String _horasTela; // 7 opções
  String _fuma; // 3 opções
  String _cigarrosDia; // 8 opções
  int _idadeFumar; // anos ou 1 opção
  String _estadoCivil; // 4 opções
  String _etnia; // 7 opções
  String _estadoSaude; // 7 opções
  String _planoSaude; // 2 opções
  String _pressaoAlta; // 3 opções
  String _diabetes; // 3 opções 

  // criando o construtor da classe
  Question();

  // construtor para recuperar os questionarios salvos no banco
  Question.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.documentID;
    this.bairro = documentSnapshot["bairro"];
    this.idade = documentSnapshot["idade"];
    this.sexo = documentSnapshot["sexo"];
    this.escolaridade = documentSnapshot["escolaridade"];
    this.peso = documentSnapshot["peso"];
    this.altura = documentSnapshot["altura"];
    this.pesoIdadeVinteAnos = documentSnapshot["pesoIdadeVinteAnos"];
    this.alimentacaoFeijao = documentSnapshot["alimentacaoFeijao"];
    this.alimentacaoVerduraLegume = documentSnapshot["alimentacaoVerduraLegume"];
    this.alimentacaoSalada = documentSnapshot["alimentacaoSalada"];
    this.lavaFrutaVerdura = documentSnapshot["lavaFrutaVerdura"];
    this.alimentacaoVerduraLegumeCozido = documentSnapshot["alimentacaoVerduraLegumeCozido"];
    this.alimentacaoCarne = documentSnapshot["alimentacaoCarne"];
    this.alimentacaoFruta = documentSnapshot["alimentacaoFruta"];
    this.alimentacaoDiaFruta = documentSnapshot["alimentacaoDiaFruta"];
    this.diaRefrigerante = documentSnapshot["diaRefrigerante"];
    this.diaSuco = documentSnapshot["diaSuco"];
    this.diaAgua = documentSnapshot["diaAgua"];
    this.diaLeite = documentSnapshot["diaLeite"];
    this.frequenciaAlcool = documentSnapshot["frequenciaAlcool"];
    this.adicionaSal = documentSnapshot["adicionaSal"];
    this.praticouExercicio = documentSnapshot["praticouExercicio"];
    this.tipoExercicio = documentSnapshot["tipoExercicio"];
    this.diasExercicio = documentSnapshot["diasExercicio"];
    this.tempoExercicio = documentSnapshot["tempoExercicio"];
    this.trabalhoCaminhada = documentSnapshot["trabalhoCaminhada"];
    this.trabalhoPeso = documentSnapshot["trabalhoPeso"];
    this.idaTrabalho = documentSnapshot["idaTrabalho"];
    this.tempoIdaTrabalho = documentSnapshot["tempoIdaTrabalho"];
    this.faxinaCasa = documentSnapshot["faxinaCasa"];
    this.horasTela = documentSnapshot["horasTela"];
    this.fuma = documentSnapshot["fuma"];
    this.cigarrosDia = documentSnapshot["cigarrosDia"];
    this.idadeFumar = documentSnapshot["idadeFumar"];
    this.estadoCivil = documentSnapshot["estadoCivil"];
    this.etnia = documentSnapshot["etnia"];
    this.estadoSaude = documentSnapshot["estadoSaude"];
    this.planoSaude = documentSnapshot["planoSaude"];
    this.pressaoAlta = documentSnapshot["pressaoAlta"];
    this.diabetes = documentSnapshot["diabetes"];
  }

  // construtor para inserir questionarios no banco
  Question.gerarID() {
    Firestore db = Firestore.instance;
    CollectionReference questions = db.collection("questions");
    this.id = questions.document().documentID;
  }

  // criando um mapeamento para a classe
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = {
      "id" : this.id,
      "bairro" : this.bairro,
      "idade" : this.idade,
      "sexo" : this.sexo,
      "escolaridade" : this.escolaridade,
      "peso" : this.peso,
      "altura" : this.altura,
      "pesoIdadeVinteAnos" : this.pesoIdadeVinteAnos,
      "alimentacaoFeijao" : this.alimentacaoFeijao,
      "alimentacaoVerduraLegume" : this.alimentacaoVerduraLegume,
      "alimentacaoSalada" : this.alimentacaoSalada,
      "lavaFrutaVerdura" : this.lavaFrutaVerdura,
      "alimentacaoVerduraLegumeCozido" : this.alimentacaoVerduraLegumeCozido,
      "alimentacaoCarne" : this.alimentacaoCarne,
      "alimentacaoFruta" : this.alimentacaoFruta,
      "alimentacaoDiaFruta" : this.alimentacaoDiaFruta,
      "diaRefrigerante" : this.diaRefrigerante,
      "diaSuco" : this.diaSuco,
      "diaAgua" : this.diaAgua,
      "diaLeite" : this.diaLeite,
      "frequenciaAlcool" : this.frequenciaAlcool,
      "adicionaSal" : this.adicionaSal,
      "praticouExercicio" : this.praticouExercicio,
      "tipoExercicio" : this.tipoExercicio,
      "diasExercicio" : this.diasExercicio,
      "tempoExercicio" : this.tempoExercicio,
      "trabalhoCaminhada" : this.trabalhoCaminhada,
      "trabalhoPeso" : this.trabalhoPeso,
      "idaTrabalho" : this.idaTrabalho,
      "tempoIdaTrabalho" : this.tempoIdaTrabalho,
      "faxinaCasa" : this.faxinaCasa,
      "horasTela" : this.horasTela,
      "fuma" : this.fuma,
      "cigarrosDia" : this.cigarrosDia,
      "idadeFumar" : this.idadeFumar,
      "estadoCivil" : this.estadoCivil,
      "etnia" : this.etnia,
      "estadoSaude" : this.estadoSaude,
      "planoSaude" : this.planoSaude,
      "pressaoAlta" : this.pressaoAlta,
      "diabetes" : this.diabetes,
    };
    return map;
}

  // configurando os getters e setters
  String get id => _id;
  set id (String value) {
    _id = value;
  }

  String get bairro => _bairro;
  set bairro (String value) {
    _bairro = value;
  }

  int get idade => _idade;
  set idade (int value) {
    _idade = value;
  }

  String get sexo => _sexo;
  set sexo (String value) {
    _sexo = value;
  }

  String get escolaridade => _escolaridade;
  set escolaridade (String value) {
    _escolaridade = value;
  }

  double get peso => _peso;
  set peso (double value) {
    _peso = value;
  }

  double get altura => _altura;
  set altura (double value) {
    _altura = value;
  }

  double get pesoIdadeVinteAnos => _pesoIdadeVinteAnos;
  set pesoIdadeVinteAnos (double value) {
    _pesoIdadeVinteAnos = value;
  }

  String get alimentacaoFeijao => _alimentacaoFeijao;
  set alimentacaoFeijao (String value) {
    _alimentacaoFeijao = value;
  }

  String get alimentacaoVerduraLegume => _alimentacaoVerduraLegume;
  set alimentacaoVerduraLegume (String value) {
    _alimentacaoVerduraLegume = value;
  }

  String get alimentacaoSalada => _alimentacaoSalada;
  set alimentacaoSalada (String value) {
    _alimentacaoSalada = value;
  }

  String get lavaFrutaVerdura => _lavaFrutaVerdura;
  set lavaFrutaVerdura (String value) {
    _lavaFrutaVerdura = value;
  }

  String get alimentacaoVerduraLegumeCozido => _alimentacaoVerduraLegumeCozido;
  set alimentacaoVerduraLegumeCozido (String value) {
    _alimentacaoVerduraLegumeCozido = value;
  }

  String get alimentacaoCarne => _alimentacaoCarne;
  set alimentacaoCarne (String value) {
    _alimentacaoCarne = value;
  }

  String get alimentacaoFruta => _alimentacaoFruta;
  set alimentacaoFruta (String value) {
    _alimentacaoFruta = value;
  }

  String get alimentacaoDiaFruta => _alimentacaoDiaFruta;
  set alimentacaoDiaFruta (String value) {
    _alimentacaoDiaFruta = value;
  }

  String get diaRefrigerante => _diaRefrigerante;
  set diaRefrigerante (String value) {
    _diaRefrigerante = value;
  }

  String get diaSuco => _diaSuco;
  set diaSuco (String value) {
    _diaSuco = value;
  }

  String get diaAgua => _diaAgua;
  set diaAgua (String value) {
    _diaAgua = value;
  }

  String get diaLeite => _diaLeite;
  set diaLeite (String value) {
    _diaLeite = value;
  }

  String get frequenciaAlcool => _frequenciaAlcool;
  set frequenciaAlcool (String value) {
    _frequenciaAlcool = value;
  }

  String get adicionaSal => _adicionaSal;
  set adicionaSal (String value) {
    _adicionaSal = value;
  }

  String get praticouExercicio => _praticouExercicio;
  set praticouExercicio (String value) {
    _praticouExercicio = value;
  }

  String get tipoExercicio => _tipoExercicio;
  set tipoExercicio (String value) {
    _tipoExercicio = value;
  }

  String get diasExercicio => _diasExercicio;
  set diasExercicio (String value) {
    _diasExercicio = value;
  }

  String get tempoExercicio => _tempoExercicio;
  set tempoExercicio (String value) {
    _tempoExercicio = value;
  }

  String get trabalhoCaminhada => _trabalhoCaminhada;
  set trabalhoCaminhada (String value) {
    _trabalhoCaminhada = value;
  }

  String get trabalhoPeso => _trabalhoPeso;
  set trabalhoPeso (String value) {
    _trabalhoPeso = value;
  }

  String get idaTrabalho => _idaTrabalho;
  set idaTrabalho (String value) {
    _idaTrabalho = value;
  }

  String get tempoIdaTrabalho => _tempoIdaTrabalho;
  set tempoIdaTrabalho (String value) {
    _tempoIdaTrabalho = value;
  }
  
  String get faxinaCasa => _faxinaCasa;
  set faxinaCasa (String value) {
    _faxinaCasa = value;
  }

  String get horasTela => _horasTela;
  // ignore: unnecessary_getters_setters
  set horasTela (String value) {
    _horasTela = value;
  }

  String get fuma => _fuma;
  set fuma (String value) {
    _fuma = value;
  }

  String get cigarrosDia => _cigarrosDia;
  set cigarrosDia (String value) {
    _cigarrosDia = value;
  }

  int get idadeFumar => _idadeFumar;
  set idadeFumar (int value) {
    _idadeFumar = value;
  }

  String get estadoCivil => _estadoCivil;
  set estadoCivil (String value) {
    _estadoCivil = value;
  }

  String get etnia => _etnia;
  set etnia (String value) {
    _etnia = value;
  }

  String get estadoSaude => _estadoSaude;
  set estadoSaude (String value) {
    _estadoSaude = value;
  }

  String get planoSaude => _planoSaude;
  set planoSaude (String value) {
    _planoSaude = value;
  }

  String get pressaoAlta => _pressaoAlta;
  set pressaoAlta (String value) {
    _pressaoAlta = value;
  }

  String get diabetes => _diabetes;
  set diabetes (String value) {
    _diabetes = value;
  }
}