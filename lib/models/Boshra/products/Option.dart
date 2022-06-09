class Option{

  String value  , name;
  var option_type_id , id ;


  factory Option.fromJson(Map<String , dynamic> json)
  {

    return Option(value : json['value'] , name : json['name'] , id : json['id'] , option_type_id : json['option_type_id']);
  }

  Option({required this.value , required this.name , required this.id , required this.option_type_id});

}


class OptionModel{

  List<Option>data ;
  OptionModel({required this.data}) ;

  factory OptionModel.fromJson(Map<String , dynamic> json)
  {
    return OptionModel(
        data:List<Option>.from(json['data'].map((p)=>Option.fromJson(p))).toList()
    ) ;
  }
}