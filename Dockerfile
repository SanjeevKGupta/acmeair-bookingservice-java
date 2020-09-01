FROM open-liberty:kernel

COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml
COPY --chown=1001:0 src/main/liberty/config/server.env /config/server.env
COPY --chown=1001:0 src/main/liberty/config/jvm.options /config/jvm.options

COPY --chown=1001:0 target/acmeair-bookingservice-java-3.3.war /config/apps/

ARG CREATE_OPENJ9_SCC=true
ENV OPENJ9_SCC=${CREATE_OPENJ9_SCC}
ENV ACCESS_LOGGING_ENABLED=false
ENV TRACE_SPEC=*=info

RUN configure.sh
