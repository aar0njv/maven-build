FROM alpine/java:22

ARG EXAMPLE_ARG=default_argument

RUN echo $EXAMPLE_ARG > /tmp/test_arg.txt

RUN mkdir -p /app

ADD target/techapp-1.0.0.jar /app

CMD ["java", "-jar", "/app/techapp-1.0.0.jar"]
