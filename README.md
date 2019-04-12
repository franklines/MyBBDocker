# MyBBDocker
A MyBB forum docker container image.
---
# Build the image on your local machine.
```bash
[~] docker build -t 'franks-mybb:latest' -f Dockerfile .
```

# To setup using docker-compose. (don't forget to update docker-compose.yml file with desired database parameters)
```bash
[~] docker-compose -f docker-compose.yml up -d
```
