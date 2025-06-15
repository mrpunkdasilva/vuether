# Vuether - Vue.js Weather Application

[![Vue.js](https://img.shields.io/badge/Vue.js-v3.2.13-4FC08D?style=flat-square&logo=vue.js)](https://vuejs.org/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=flat-square&logo=docker)](https://www.docker.com/)
[![OpenWeatherMap](https://img.shields.io/badge/API-OpenWeatherMap-orange?style=flat-square)](https://openweathermap.org/)

A sleek, responsive weather application built with Vue.js that provides real-time weather information for any location worldwide. The application features a dynamic background that changes based on the temperature.

![Vuether Screenshot](https://via.placeholder.com/800x400?text=Vuether+Screenshot)

## 🌟 Features

- **Real-time Weather Data**: Get current weather information from OpenWeatherMap API
- **Responsive Design**: Works on desktop and mobile devices
- **Dynamic UI**: Background changes based on temperature (warm/cold)
- **Search Functionality**: Look up weather by city name
- **Temperature Display**: View temperature in Celsius
- **Weather Conditions**: Shows current weather conditions (sunny, cloudy, etc.)

## 🚀 Quick Start

### Prerequisites

- [Node.js](https://nodejs.org/) (v14 or higher)
- [npm](https://www.npmjs.com/) (v6 or higher)
- OpenWeatherMap API key (get one for free at [OpenWeatherMap](https://openweathermap.org/api))

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/vuether.git
   cd vuether
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file in the root directory based on `.env.example`:
   ```
   API_SECRET=your_openweathermap_api_key
   API_URL_BASE=http://api.openweathermap.org/data/2.5/
   ```

4. Start the development server:
   ```bash
   npm run serve
   ```

5. Open your browser and navigate to `http://localhost:8080`

## 🐳 Docker Setup

### Using Docker Compose

1. Build and run the container:
   ```bash
   docker compose up -d
   ```

2. Access the application at `http://localhost:8080`

### Manual Docker Setup

1. Build the Docker image:
   ```bash
   docker build -t vuether .
   ```

2. Run the container:
   ```bash
   docker run -p 8080:80 -e API_SECRET=your_api_key vuether
   ```

3. Access the application at `http://localhost:8080`

## 🛠️ Development

### Project Structure

```
vuether/
├── public/             # Static files
├── src/                # Source files
│   ├── assets/         # Images and assets
│   ├── components/     # Vue components
│   ├── App.vue         # Main application component
│   └── main.js         # Application entry point
├── .env.example        # Example environment variables
├── Dockerfile          # Docker configuration
├── docker-compose.yml  # Docker Compose configuration
└── package.json        # Project dependencies
```

### Available Scripts

- **Development server**:
  ```bash
  npm run serve
  ```

- **Build for production**:
  ```bash
  npm run build
  ```

- **Lint and fix files**:
  ```bash
  npm run lint
  ```

## 📝 API Usage

This application uses the OpenWeatherMap API to fetch weather data. The API endpoint used is:

```
http://api.openweathermap.org/data/2.5/weather?q={CITY_NAME}&units=metric&APPID={API_KEY}
```

## 🔧 Customization

You can customize the application by modifying the following files:
- `src/App.vue`: Main application logic and UI
- `src/assets/`: Replace background images for different weather conditions

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [OpenWeatherMap](https://openweathermap.org/) for providing the weather data API
- [Vue.js](https://vuejs.org/) for the progressive JavaScript framework
- [Docker](https://www.docker.com/) for containerization