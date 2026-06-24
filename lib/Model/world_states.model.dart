class WorldStatesModel {
  WorldStatesModel({
    int? updated,
    int? cases,
    int? todayCases,
    int? deaths,
    int? todayDeaths,
    int? recovered,
    int? todayRecovered,
    int? active,
    int? critical,
    int? casesPerOneMillion,
    int? deathsPerOneMillion,
    int? tests,
    int? population,
    int? oneCasePerPeople,
    int? oneDeathPerPeople,
    int? oneTestPerPeople,
    int? affectedCountries,
  }) {
    _updated = updated;
    _cases = cases;
    _todayCases = todayCases;
    _deaths = deaths;
    _todayDeaths = todayDeaths;
    _recovered = recovered;
    _todayRecovered = todayRecovered;
    _active = active;
    _critical = critical;
    _tests = tests;
    _population = population;
    _oneCasePerPeople = oneCasePerPeople;
    _oneDeathPerPeople = oneDeathPerPeople;
    _oneTestPerPeople = oneTestPerPeople;
    _affectedCountries = affectedCountries;
  }

  WorldStatesModel.fromJson(dynamic json) {
    _updated = json['updated'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _tests = json['tests'];
    _population = json['population'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _affectedCountries = json['affectedCountries'];
  }
  int? _updated;
  int? _cases;
  int? _todayCases;
  int? _deaths;
  int? _todayDeaths;
  int? _recovered;
  int? _todayRecovered;
  int? _active;
  int? _critical;
  int? _tests;
  int? _population;
  int? _oneCasePerPeople;
  int? _oneDeathPerPeople;
  int? _oneTestPerPeople;
  int? _affectedCountries;
  int? get updated => _updated;
  int? get cases => _cases;
  int? get todayCases => _todayCases;
  int? get deaths => _deaths;
  int? get todayDeaths => _todayDeaths;
  int? get recovered => _recovered;
  int? get todayRecovered => _todayRecovered;
  int? get active => _active;
  int? get critical => _critical;
  int? get tests => _tests;
  int? get population => _population;
  int? get oneCasePerPeople => _oneCasePerPeople;
  int? get oneDeathPerPeople => _oneDeathPerPeople;
  int? get oneTestPerPeople => _oneTestPerPeople;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated'] = _updated;
    map['cases'] = _cases;
    map['todayCases'] = _todayCases;
    map['deaths'] = _deaths;
    map['todayDeaths'] = _todayDeaths;
    map['recovered'] = _recovered;
    map['todayRecovered'] = _todayRecovered;
    map['active'] = _active;
    map['critical'] = _critical;
    map['tests'] = _tests;
    map['population'] = _population;
    map['oneCasePerPeople'] = _oneCasePerPeople;
    map['oneDeathPerPeople'] = _oneDeathPerPeople;
    map['oneTestPerPeople'] = _oneTestPerPeople;
    map['affectedCountries'] = _affectedCountries;
    return map;
  }
}
