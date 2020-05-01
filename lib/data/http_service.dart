import 'package:covid/model/corona.dart';
import 'package:covid/model/covid.dart';
import 'package:http/http.dart' ;

class HttpService {
  final String url =
        "https://api.covid19api.com/live/country/bangladesh/status/confirmed";

  Future<List<Corona>> getCoronaData() async {
        Response response = await  get(url);

    if (response.statusCode == 200) { 
 

      return coronaFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data. Check your interent!");
    }
  }
  Future<Corona> getNewResult() async {
    Response response = await  get(url);
    if(response.statusCode == 200){
      List<Corona> data = coronaFromJson(response.body.toString());
      int newAffected = data[data.length - 1].confirmed.toInt() - data[data.length - 2].confirmed.toInt();
      int newDeath = data[data.length - 1].deaths.toInt() - data[data.length - 2].deaths.toInt();
      int newRecover = data[data.length - 1].recovered.toInt() - data[data.length - 2].recovered.toInt();
      final Corona c = new Corona(
        deaths: newDeath,
        confirmed: newAffected,
        recovered: newRecover,
        date: data[data.length-1].date,
      );
      print(c.date.toString());
      print(c.deaths.toString());
      print(c.confirmed.toString());

      return c;
    } else {
      throw "Error";
    }


  }

    Future<Countrydatum> getCovidData() async {
        String baseUrl = "https://thevirustracker.com/free-api?countryTotal=BD";
        Response response = await get(baseUrl);
        if(response.statusCode == 200){
          Covid data = covidFromJson(response.body.toString());
          Countrydatum virusData = data.countrydata[0];

          // print(virusData.totalDeaths.toString());
          // print(virusData.totalActiveCases.toString());

          return virusData;

        } else {
          throw "Couldn't load data";
        }
    }


}
