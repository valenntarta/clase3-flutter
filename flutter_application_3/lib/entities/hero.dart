final Map<String, dynamic> heroData= {
'name': 'Superman', 
'power': 'Fly', 
'isAlive': true,
};

class Hero{
  String name;
  String power;
  bool isAlive; //_isAlive para poner privado un atributo

  Hero ({required this.name, required this.power, required this.isAlive});
  //required para no necesitar ordenar los paramentros del objeto al crearlo

  Hero.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      power = json['power'],
      isAlive = json['isAlive'];  
//para manejar un json
}

//final number = [1, 2, 3];
//numbers.toSet()  saco repetidos
// pubdev librerias (go router)
