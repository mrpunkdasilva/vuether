#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting Vuether Docker environment...${NC}"

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Build and start the containers
echo -e "${YELLOW}Building and starting containers...${NC}"
docker-compose up -d --build

# Check if containers are running
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Vuether is now running!${NC}"
    echo -e "${GREEN}Access the application at: http://localhost:8080${NC}"
else
    echo "Failed to start Docker containers. Please check the logs."
    exit 1
fi