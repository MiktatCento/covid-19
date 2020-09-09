class HomeStats {
  final int cases;
  final int tested;
  final int deaths;
  final int recovered;
  final int dailyCases;
  final int dailyTested;
  final int dailyDeaths;
  final int dailyRecovered;
  final String latestUpdated;

  HomeStats({
    this.cases,
    this.tested,
    this.deaths,
    this.recovered,
    this.dailyCases,
    this.dailyTested,
    this.dailyDeaths,
    this.dailyRecovered,
    this.latestUpdated,
  });

  factory HomeStats.fromJSON(Map<String, dynamic> json) {
    return HomeStats(
        cases: json['infected'],
        tested: json['tested'],
        deaths: json['deceased'],
        recovered: json["recovered"],
        dailyCases: json["dailyInfected"],
        dailyTested: json["dailyTested"],
        dailyDeaths: json["dailyDeceased"],
        dailyRecovered: json["dailyRecovered"],
        latestUpdated: json["lastUpdatedAtApify"]);
  }
}
