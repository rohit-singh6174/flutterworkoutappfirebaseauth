class Workout{
  int id;
  String name;
  String category;
  String gif;
  String reps;
  String sets;
  String imageUrl;
  String listimgurl;
  String youtubeUrl;

  Workout({this.id=0, this.name="", this.category="", this.gif="",this.reps="",this.sets="" ,this.imageUrl="",this.listimgurl="" ,this.youtubeUrl=""});

  factory Workout.fromJson(Map <String, dynamic>json){
    return Workout(
        id:json['id'],
        name: json['name'],
        category:json['category'],
        gif: json['gif'],
        reps: json['reps'],
        sets: json['sets'],
        imageUrl:json['imageUrl'],
        listimgurl:json['listimgurl'],
        youtubeUrl:json['youtubeUrl']
    );
  }
  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String, dynamic>();
    data['id']=this.id;
    data['name']=this.name;
    data['category']=this.category;
    data['gif']=this.gif;
    data['reps']=this.reps;
    data['sets']=this.sets;
    data['imageUrl']=this.imageUrl;
    data['listimgurl']=this.listimgurl;
    data['youtubeUrl']=this.youtubeUrl;

    return data;

  }
}