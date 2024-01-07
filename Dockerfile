FROM breakedup/base-image
ADD ./target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar /spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar
ADD ./run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8080:8080
CMD /run.sh
