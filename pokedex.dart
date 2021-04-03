import 'dart:developer';

class Pokedex {
  List<Pokemon> pokemon = [];

  Pokedex({required this.pokemon});

  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      json['pokemon'].forEach((v) {
        Pokemon p = new Pokemon.fromJson(v);
        pokemon.add(p);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }

  noSuchMethod(Invocation invocation) {
    log(invocation.toString());
    super.noSuchMethod(invocation); // Will throw.
  }
}

class Pokemon {
  late int id;
  late String num;
  late String name;
  late String img;
  late List<String> type;
  late String height;
  late String weight;
  String? candy;
  int? candyCount;
  String? egg;
  String? spawnChance;
  String? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  late List<String> weaknesses;
  List<PrevEvolution>? prevEvolution;
  List<NextEvolution>? nextEvolution;

  Pokemon(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      required this.weaknesses,
      this.prevEvolution,
      this.nextEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'].toString();
    name = json['name'].toString();
    img = json['img'].toString();
    type = json['type'].cast<String>();
    height = json['height'].toString();
    weight = json['weight'].toString();
    candy = json['candy'].toString();
    candyCount = json['candy_count'];
    egg = json['egg'].toString();
    spawnChance = json['spawn_chance'].toString();
    avgSpawns = json['avg_spawns'].toString();
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers']?.cast<double>();
    weaknesses = json['weaknesses'].cast<String>();
    if (json['prev_evolution'] != null) {
      prevEvolution = [];
      json['prev_evolution'].forEach((v) {
        prevEvolution!.add(new PrevEvolution.fromJson(v));
      });
    }
    if (json['next_evolution'] != null) {
      nextEvolution = [];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(new NextEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['candy_count'] = this.candyCount;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;
    data['weaknesses'] = this.weaknesses;
    if (this.prevEvolution != null) {
      data['prev_evolution'] =
          this.prevEvolution!.map((v) => v.toJson()).toList();
    }
    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  noSuchMethod(Invocation invocation) {
    log(invocation.toString());
    super.noSuchMethod(invocation); // Will throw.
  }
}

class PrevEvolution {
  late String num;
  late String name;

  PrevEvolution({required this.num, required this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }

  noSuchMethod(Invocation invocation) {
    log(invocation.toString());
    super.noSuchMethod(invocation); // Will throw.
  }
}

class NextEvolution {
  late String num;
  late String name;

  NextEvolution({required this.num, required this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }

  noSuchMethod(Invocation invocation) {
    log(invocation.toString());
    super.noSuchMethod(invocation); // Will throw.
  }
}
