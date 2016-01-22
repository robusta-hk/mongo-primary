FROM mongo:3.2

MAINTAINER Nicolas Zozol - nz@robusta.io - http://www.robusta.io


#RUN apt-get update && apt-get install -y procps \
#                    && apt-get clean \
#                    && rm -rf /var/lib/apt/lists/*




# Warning : js script will use this directory
RUN mkdir --parents /data/db && mkdir --parents /opt/setup \
        && mkdir --parents /opt/conf && chown -R mongodb:mongodb /data/db
WORKDIR /opt/setup/

RUN echo "++++ working at : $(pwd)"


COPY create-users.js /opt/setup/
COPY create-replica.js /opt/setup/


VOLUME /opt/conf

# If We don't want again to treat this master as an executable
# ENTRYPOINT ["/bin/bash"]

