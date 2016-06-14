FROM java:8
MAINTAINER cory.a.johannsen@gmail.com

RUN mkdir -p /data/app
ADD build/libs/*.jar /data/app/grocerylister.jar
WORKDIR /data/app

EXPOSE 9000

CMD ["java", "-Dspring.profiles.active=production", "-jar", "/data/app/grocerylister.jar"]

