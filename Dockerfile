FROM rocker/r-base:latest
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk libcurl4-openssl-dev
  
RUN R -e "install.packages('Rserve',,'http://www.rforge.net/')"&&install2.r --error \
    -r "https://cran.rstudio.com" \
    data.table dplyr lubridate stringr forecast tidyr RJDBC && \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY init /init
EXPOSE 6311 8787

CMD bash /init
#ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
#CMD ["R", "CMD", "Rserve"]
#CMD /init&&R -e "Rserve::run.Rserve(remote=TRUE)" 
