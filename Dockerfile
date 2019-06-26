FROM rocker/verse:latest

RUN apt-get update \
  && apt-get install -y libclang-dev libxkbcommon-x11-0

COPY latest.R /opt/

RUN Rscript /opt/latest.R

RUN dpkg -i rstudio-server-daily-amd64.deb \
  && rm rstudio-server-*-amd64.deb 

CMD ["/init"]
