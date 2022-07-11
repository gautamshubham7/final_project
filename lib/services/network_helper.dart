import 'package:final_last/models/apiModel.dart';
import 'package:http/http.dart' as http;

class NetworkHepler {
  //getAPi is converted to list
  Future<List<GetApi>?> getApiResponse() async {
    var response =
        await http.get(Uri.parse('http://mark.bslmeiyu.com/api/getplaces'));
    if (response.statusCode == 200) {
      var body = getApiFromJson(response.body);
      print(body);
      return body;
    } else {
      print('error');
    }
  }
}
