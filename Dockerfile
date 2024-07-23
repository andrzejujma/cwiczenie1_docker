#uzywamy dystrybucji i paczki Alpine z Docherhub
FROM alpine:latest
# Instalacja niezbędnych pakietów
RUN apk add --no-cache nginx mariadb mariadb-client openrc bash
#Tworzenie nowego uzytkownika
RUN adduser -D -g 'www' www
#Tworzymy katalogi dla nginx
RUN mkdir /www && \
    mkdir -p /run/nginx
#kopiowanie plików index.html
COPY index.html /www/index.html
#konfiguracja nginx
COPY nginx.conf /etc/nginx/nginx.conf
#Automatyczne uruchamianie
RUN rc-update add nginx default && \
    rc-update add mariadb default
#kopiowanie i nadawnanie uprawnien do skryptów startowych
COPY start.sh /start.sh
RUN chmod +x /start.sh
#Otwarcie portów nginx i mysql
EXPOSE 80 3306
#Uruchomienie skryptu startowego przy starcie kontenera
CMD ["/start.sh"]


