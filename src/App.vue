<template>
  <div id="app" :class="typeof weather.main != 'undefined' && weather.main.temp > 16? 'warm' : ''">

    <main>
      <div class="search-box">
        <input
            type="text"
            class="search-bar"
            placeholder="Pesquisar por..."
            v-model="query"
            @keypress="fetchWeather"
        />
      </div>

      <div class="weather-wrapper" v-if="typeof weather.main != 'undefined'">
        <div class="location-box">
          <div class="location">
            {{ weather.name }}, {{ weather.sys.country }}
            <br>
            <center>
              <hr width="300px">
            </center>
          </div>
          <div class="date">
            {{ dateBuilder() }}
          </div>
        </div>

        <div class="weather-box">
          <div class="temp">
            {{ Math.round(weather.main.temp) }}°
          </div>

          <div class="weather">
            {{ weather.weather[0].main }}
          </div>
        </div>
      </div>
    </main>

  </div>
</template>

<script>
export default {
  name : 'App',
  data() {
    return {
      api_key : process.env.VUE_APP_API_SECRET || "f68319eac8a48a7cc0c42f0fee2354de",
      url_base : process.env.VUE_APP_API_URL_BASE || "http://api.openweathermap.org/data/2.5/",
      query : "",
      weather : {},
    }
  },
  methods : {
    fetchWeather( e ) {
      if ( e.key == "Enter" ) {
        fetch( `${ this.url_base }weather?q=${ this.query }&units=metric&APPID=${ this.api_key }` )
            .then( ( response ) => {
              return response.json();
            } )
            .then( this.setResults );
      }
      console.log(`${ this.url_base }weather?q=${ this.query }&units=metric&APPID=${ this.api_key }`);
    },
    setResults( results ) {
      this.weather = results;
    },
    dateBuilder() {
      let d = new Date();
      let months = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jul", "Jun", "Ago", "Set", "Out", "Nov", "Dez"];

      let day = d.getDate();
      let month = months[d.getMonth()];
      let year = d.getFullYear();

      return `${day} ${month}, ${year}`
    }
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

#app {
  background-image: url("./assets/cold.png");
  background-size: contain;
  background-position: bottom;
  transition: 0.45s;
}

#app.warm {
  background-image: url("./assets/wurm.png");
}

main {
  min-height: 100vh;
  padding: 1rem;
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.75));
}

.search-box {
  width: 100%;
  margin-bottom: 30px;
}

.search-box .search-bar {
  display: block;
  width: 100%;

  color: #313131;
  font-size: 1.2rem;

  background: rgba(255, 255, 255, 0.5) none;
  appearance: none;
  padding: 1rem;
  border: none;
  border-radius: 0px 16px 0px 16px;
  outline: none;

  transition: 0.4s;
}

.search-box .search-bar:focus {
  box-shadow: 0px 0px 16px rgba(0, 0, 0, 0.25);
  background-color: rgba(255, 255, 255, 0.75);
  border-radius: 16px 0px 16px 0px;
}

.location-box .location {
  color: #fff;
  font-size: 32px;
  font-weight: 500;
  text-align: center;
  text-shadow: #313;
}

.location-box .date {
  color: #fff;
  font-size: 20px;
  font-weight: 300;
  font-style: italic;
  text-align: center;

  margin-top: 23px;
}

.weather-box {
  text-align: center;
}

.weather-box .temp {
  display: inline-block;
  padding: 10px 25px;

  color: #fff;
  font-size: 102px;
  font-weight: 900;

  text-shadow: 3px 6px rgba(0, 0, 0, 0.25);
  background-color: rgba(255, 255, 255, 0.25);
  border-radius: 16px;
  margin: 30px 0px;

  box-shadow: 3px 6px rgba(255, 255, 255, 0.25);
}

.weather-box .weather {
  color: #ffffff;
  font-size: 48px;
  font-weight: 700;
  font-style: italic;
  text-shadow: 3px 6px rgba(0, 0, 0, 0.25);
}
</style>
