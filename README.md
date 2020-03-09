# Coronavirus Analysis

This repo is a workspace for analyzing and aggregating data regaring the Coronavirus and its associated disease, 
COVID-19.

## Sources

Data is aggregated from multiple sources.

### Johns Hopkins CSSE

This dataset includes timeseries in CSV format for confirmed cases, deaths, and recoveries. Each is a separate CSV file,
with each row containing the following:

* Province/State: Can be empty, sometimes contains municipality information (e.g. "Cook County, IL" in the US)
* Country/Region: Never empty, will be something like "US" or "Vatican City" or "Mainland China"
* Latitude: either a float or an int
* Longitude: same as latitude

The remaining columns are each a day's point in the series of points for that locality. The header row contains the 
literal dates.

https://github.com/CSSEGISandData/COVID-19

### Iceweasel1 German Data



https://github.com/iceweasel1/COVID-19-Germany