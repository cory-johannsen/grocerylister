FROM java:8
MAINTAINER cory.a.johannsen@gmail.com

RUN mkdir -p /data/app
RUN mkdir -p /data/app/newrelic

ADD build/libs/*.jar /data/app/grocerylister.jar
ADD newrelic/* data/app/newrelic
WORKDIR /data/app

EXPOSE 9000

CMD ["java", "-javaagent:/data/app/newrelic/newrelic.jar", "-Dspring.profiles.active=production", "-jar", "/data/app/grocerylister.jar"]

