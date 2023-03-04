FROM nginx:stable

ARG SSL_CERT_PUBLIC
ARG SSL_CERT_PRIVATE
ARG PROJECT_USER_ID
ARG PROJECT_GROUP_ID

RUN groupadd -g ${PROJECT_GROUP_ID} project
RUN useradd -u ${PROJECT_USER_ID} -g ${PROJECT_GROUP_ID} project
RUN usermod -a -G project www-data

RUN apt update
RUN apt install -y ssl-cert
RUN make-ssl-cert generate-default-snakeoil

RUN mkdir -p $(dirname ${SSL_CERT_PUBLIC}) $(dirname ${SSL_CERT_PRIVATE})
RUN rm -f ${SSL_CERT_PUBLIC} ${SSL_CERT_PRIVATE}
RUN ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem ${SSL_CERT_PUBLIC}
RUN ln -s /etc/ssl/private/ssl-cert-snakeoil.key ${SSL_CERT_PRIVATE}

RUN chown root:root $(dirname ${SSL_CERT_PUBLIC})/* $(dirname ${SSL_CERT_PRIVATE})/*
RUN chmod 600 $(dirname ${SSL_CERT_PUBLIC})/* $(dirname ${SSL_CERT_PRIVATE})/*
