// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toJson());

class Covid {
    final List<Countrydatum> countrydata;
    final String stat;

    Covid({
        this.countrydata,
        this.stat,
    });

    factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        countrydata: List<Countrydatum>.from(json["countrydata"].map((x) => Countrydatum.fromJson(x))),
        stat: json["stat"],
    );

    Map<String, dynamic> toJson() => {
        "countrydata": List<dynamic>.from(countrydata.map((x) => x.toJson())),
        "stat": stat,
    };
}

class Countrydatum {
    final Info info;
    final int totalCases;
    final int totalRecovered;
    final int totalUnresolved;
    final int totalDeaths;
    final int totalNewCasesToday;
    final int totalNewDeathsToday;
    final int totalActiveCases;
    final int totalSeriousCases;
    final int totalDangerRank;

    Countrydatum({
        this.info,
        this.totalCases,
        this.totalRecovered,
        this.totalUnresolved,
        this.totalDeaths,
        this.totalNewCasesToday,
        this.totalNewDeathsToday,
        this.totalActiveCases,
        this.totalSeriousCases,
        this.totalDangerRank,
    });

    factory Countrydatum.fromJson(Map<String, dynamic> json) => Countrydatum(
        info: Info.fromJson(json["info"]),
        totalCases: json["total_cases"],
        totalRecovered: json["total_recovered"],
        totalUnresolved: json["total_unresolved"],
        totalDeaths: json["total_deaths"],
        totalNewCasesToday: json["total_new_cases_today"],
        totalNewDeathsToday: json["total_new_deaths_today"],
        totalActiveCases: json["total_active_cases"],
        totalSeriousCases: json["total_serious_cases"],
        totalDangerRank: json["total_danger_rank"],
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "total_cases": totalCases,
        "total_recovered": totalRecovered,
        "total_unresolved": totalUnresolved,
        "total_deaths": totalDeaths,
        "total_new_cases_today": totalNewCasesToday,
        "total_new_deaths_today": totalNewDeathsToday,
        "total_active_cases": totalActiveCases,
        "total_serious_cases": totalSeriousCases,
        "total_danger_rank": totalDangerRank,
    };
}

class Info {
    final int ourid;
    final String title;
    final String code;
    final String source;

    Info({
        this.ourid,
        this.title,
        this.code,
        this.source,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        ourid: json["ourid"],
        title: json["title"],
        code: json["code"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "ourid": ourid,
        "title": title,
        "code": code,
        "source": source,
    };
}
