class Personajes{
  String id = "";
  String name = "";
  String url = "";
  String descripcion = "";
  int comics = 0;
 

  Personajes(id,name, url, descripcion, comics){
    this.id = id.toString();
    this.name = name;
    this.descripcion = descripcion;
    this.url= url+'.jpg';
    this.comics = comics;
    
  }


} 