# Using Node.js base image based on alpine
FROM node:lts-alpine3.20

# Set the working directory inside the container
WORKDIR /app

# Install dependencies required for Oracle Instant Client

RUN apk --no-cache add libaio libnsl libc6-compat curl unzip bash && \
    cd /tmp && \
    curl -o instantclient-basiclite.zip https://download.oracle.com/otn_software/linux/instantclient/1926000/instantclient-basiclite-linux.x64-19.26.0.0.0dbru.zip -SL && \
    unzip instantclient-basiclite.zip && \
    mv instantclient*/ /usr/lib/instantclient && \
    rm instantclient-basiclite.zip && \
    ln -s /usr/lib/instantclient/libclntsh.so.19.1 /usr/lib/libclntsh.so && \
    ln -s /usr/lib/instantclient/libocci.so.19.1 /usr/lib/libocci.so && \
    ln -s /usr/lib/instantclient/libociicus.so /usr/lib/libociicus.so && \
    ln -s /usr/lib/instantclient/libnnz19.so /usr/lib/libnnz19.so && \
    ln -s /usr/lib/libnsl.so.3 /usr/lib/libnsl.so.1 && \
    ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 && \
    ln -s /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2

# Add Instant Client path to the environment variable
ENV LD_LIBRARY_PATH=/usr/lib/instantclient

RUN yarn add global pm2

# Clean up cache to keep the image size small
RUN rm -rf /var/cache/apk/*

# Add default command for the base image
CMD ["node"]
