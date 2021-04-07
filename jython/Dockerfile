FROM openjdk:slim-buster

WORKDIR /usr/share/jython/
RUN apt update && apt install -y curl && \
      curl -o jython.jar -fsS "$(curl -fsS 'https://www.jython.org/download' | grep -oP 'https://.*jython-standalone/[\d\.]+/.*\.jar')" && \
      chmod +x jython.jar && rm -rf /var/lib/apt/lists/*
RUN java --illegal-access=deny -jar ./jython.jar -m ensurepip

ENTRYPOINT [ "java", "--illegal-access=deny", "-jar", "./jython.jar" ]
