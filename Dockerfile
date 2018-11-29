FROM rocker/r-base:latest
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk \
  && ln -s /lib/x86_64-linux-gnu/libpcre.so.3.13.3 /lib/x86_64-linux-gnu/libpcre.so \
  && ln -s /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so \
  && ln -s /lib/x86_64-linux-gnu/libbz2.so.1 /lib/x86_64-linux-gnu/libbz2.so \
  && ln -s /lib/x86_64-linux-gnu/liblzma.so.5.2.2 /lib/x86_64-linux-gnu/liblzma.so \
  && ln -s /usr/lib/x86_64-linux-gnu/libicuuc.so.57 /lib/x86_64-linux-gnu/libicuuc.so \
  && ln -s /usr/lib/x86_64-linux-gnu/libicui18n.so.57 /lib/x86_64-linux-gnu/libicui18n.so
  
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
