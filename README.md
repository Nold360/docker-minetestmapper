# Minetestmapper in a Docker Container
## Build:
`docker build -t minetestmapper .`

## Run
This will generate a map.png in your world's directory:
`docker run -v/path/to/my/world:/world -ti minetestmapper`
