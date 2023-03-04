FROM nginx:stable

ARG SSL_CERT_FOLDER
ARG SSL_CERT_PUBLIC
ARG SSL_CERT_PRIVATE

RUN groupadd -g 1000 project
RUN useradd -u 1000 -g 1000 project
RUN usermod -a -G project www-data

RUN apt update
RUN apt install -y ssl-cert
RUN make-ssl-cert generate-default-snakeoil

RUN mkdir -p $SSL_CERT_FOLDER
RUN rm -f ${SSL_CERT_PUBLIC}
RUN rm -f ${SSL_CERT_PRIVATE}
RUN ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem   ${SSL_CERT_PUBLIC}
RUN ln -s /etc/ssl/private/ssl-cert-snakeoil.key ${SSL_CERT_PRIVATE}

RUN chown root:root ${SSL_CERT_FOLDER}/*
RUN chmod 600       ${SSL_CERT_FOLDER}/*
