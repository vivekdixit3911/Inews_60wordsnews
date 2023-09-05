import 'dart:convert';
import 'package:http/http.dart' as http;

const String Apikey = "&apiKey=f38d918f6c2c43db854407a3ef3487d4";

Future callinApi(String links) async {
  final url = Uri.parse("$links$Apikey");
  final url2 = await http.get(url);

  try {
    if (url2.statusCode == 200) {
      return jsonDecode(url2.body);
    }
  } catch (e) {
    print("error $e");
  }
}
