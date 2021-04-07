FROM elrey741/jython:latest

RUN java --illegal-access=deny -jar ./jython.jar -m pip install inql

ENTRYPOINT [ "java", "--illegal-access=deny", "-jar", "./jython.jar", "-m", "inql", "--nogui" ]
