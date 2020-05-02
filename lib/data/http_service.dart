import 'package:covid/model/corona.dart';
import 'package:covid/model/covid.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class HttpService {
  final String url = "https://api.covid19api.com/dayone/country/bangladesh";
  DateTime lastUpdate;

  Future<List<Corona>> getCoronaData() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<Corona> data = coronaFromJson(response.body.toString());
      lastUpdate = data[data.length - 2].date;

      return coronaFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data. Check your interent!");
    }
  }

  Future<Corona> getNewResult() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      List<Corona> data = coronaFromJson(response.body.toString());
      int newAffected = data[data.length - 2].confirmed.toInt() -
          data[data.length - 3].confirmed.toInt();
      int newDeath = data[data.length - 2].deaths.toInt() -
          data[data.length - 3].deaths.toInt();
      int newRecover = data[data.length - 2].recovered.toInt() -
          data[data.length - 3].recovered.toInt();
      lastUpdate = data[data.length - 2].date;
      Corona c = new Corona(
        deaths: newDeath,
        confirmed: newAffected,
        recovered: newRecover,
        date: data[data.length - 2].date,
      );
      print(c.date.toString());
      print(c.deaths.toString());
      print(c.confirmed.toString());

      return c;
    } else {
      throw "Error";
    }
  }

  getLastDate() { 
    if(lastUpdate == null){
      print('null');
      return "";
    } 
     return "Last update on "+ DateFormat.MMMd().format(lastUpdate).toString();
 
  }

  Future<Countrydatum> getCovidData() async {
    String baseUrl = "https://thevirustracker.com/free-api?countryTotal=BD";
    Response response = await get(baseUrl);
    if (response.statusCode == 200) {
      Covid data = covidFromJson(response.body.toString());
      Countrydatum virusData = data.countrydata[0];

      return virusData;
    } else {
      throw "Couldn't load data";
    }
  }
}
