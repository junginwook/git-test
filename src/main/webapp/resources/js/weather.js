var digiWeather;

(function ( $ ) {
  'use strict';

  /**
   * API 출처
   * http://www.wunderground.com/
   */

  var apiKey;
  var locName;
  var apiUrl;

  var logger = function ( obj ) {
    if ( window.console && window.console.log ) {
      window.console.log(obj);
    }
  };

  var getIcon = function ( iconName ) {
    //return 'http://icons.wxug.com/i/c/i/' + iconName + '.gif';
    return '../resources/img/weather/' + iconName + '.png';
  };

  digiWeather = function ( key, locationName ) {
    apiKey = key;
    locName = locationName;
    apiUrl = 'http://api.wunderground.com/api/'
             + apiKey + '/geolookup/conditions/forecast/q/'
             + locName + '.json';
  };

  digiWeather.prototype.getInfo = function () {
    return $.ajax({ url: apiUrl, dataType: 'jsonp' });
  };

  digiWeather.prototype.parseData = function ( data ) {
    try {
      if ( typeof data != 'undefined'
           && typeof data.simpleforecast != 'undefined'
           && typeof data.simpleforecast.forecastday != 'undefined' ) {
        var weatherData = data.simpleforecast.forecastday;
        var dataArray = [];
        for ( var i = 0; i < weatherData.length; i++ ) {
          dataArray.push(this.parseForecastData(weatherData[ i ]));
        }
        ;

        return dataArray;
      } else {
        logger('Forecast data not found!');
      }
      return null;
    } catch ( e ) {
      alert(e.message);
    }
  };

  digiWeather.prototype.parseForecastData = function ( data ) {
    try {
      var returnObj = {
        date: null,
        icon: null,
        temp: 0
      };
      returnObj.date = new Date(parseInt(data.date.year), parseInt(data.date.month),
                                parseInt(data.date.day), parseInt(data.date.hour),
                                parseInt(data.date.min), parseInt(data.date.sec), 0);
      ;
      returnObj.icon = getIcon(data.icon);
      returnObj.temp_high = parseInt(data.high.celsius);
      returnObj.temp_low = parseInt(data.low.celsius);

      return returnObj;
    } catch ( e ) {
      alert(e.message);
    }
  };

})(jQuery);