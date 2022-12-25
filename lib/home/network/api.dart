import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

htmlParse() async{
  final response = await http.get(Uri.parse('https://zakarpat.energy/customers/break-in-electricity-supply/schedule/'));
  if(response.statusCode == 200){
    var doc = parse(response.body);
    var elemClass = doc.getElementsByTagName('p')[6].nodes[0].attributes['src'];
    return 'https://zakarpat.energy$elemClass';
  }else{
    throw Exception();
  }
}