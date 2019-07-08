mvn test -Dserver.port=8080 -Dserver.host=http://localhost


docker build --no-cache . -t auto
docker run -ti --env server.host='localhost' --env server.port='8080' auto
