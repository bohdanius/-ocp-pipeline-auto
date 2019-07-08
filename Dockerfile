FROM maven:3.6-jdk-8

#ARG AUTO_GIT_URL=git@github.com:bohdanius/ocp-pipeline-auto.git
ARG AUTO_GIT_URL=https://github.com/bohdanius/ocp-pipeline-auto.git
ENV PROJECT_PATH=ocp-pipeline-auto

RUN apt-get update && apt-get install -y git grep

RUN git clone ${AUTO_GIT_URL}

#RUN echo ${AUTO_GIT_URL} | grep -oPa '(?<=\/)(.+)(?=\.git$)' | cd

CMD  cd $PROJECT_PATH && mvn test -Dserver.host=$host -Dserver.port=$port