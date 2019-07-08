FROM maven:3.6-jdk-8

#ARG AUTO_GIT_URL=git@github.com:bohdanius/ocp-pipeline-auto.git

ARG AUTO_GIT_URL=https://github.com/bohdanius/ocp-pipeline-auto.git

RUN apt-get update && apt-get install -y git grep

RUN git clone ${AUTO_GIT_URL}
#RUN echo ${AUTO_GIT_URL} | grep -oPa '(?<=\/)(.+)(?=\.git$)' | cd


RUN echo ${AUTO_GIT_URL} | '(?<=\/(?!.*\/))(.+)(?=\.git$)' | cd
RUN ls
CMD ls && cd ocp-pipeline-auto && mvn test
#CMD mvn tests -Dserver.host=$host -Dserver.port=$port