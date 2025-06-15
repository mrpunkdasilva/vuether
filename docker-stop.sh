#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Stopping Vuether Docker environment...${NC}"

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Stop the containers
docker-compose down

# Check if containers are stopped
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Vuether Docker environment has been stopped.${NC}"
else
    echo "Failed to stop Docker containers. Please check the logs."
    exit 1
fi