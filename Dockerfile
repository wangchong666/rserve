FROM rocker/rstudio-stable:latest
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk \
  && ln -s /lib/x86_64-linux-gnu/libpcre.so.3.13.3 /lib/x86_64-linux-gnu/libpcre.so \
  && ln -s /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so \
  && ln -s /lib/x86_64-linux-gnu/libbz2.so.1 /lib/x86_64-linux-gnu/libbz2.so \
  && ln -s /lib/x86_64-linux-gnu/liblzma.so.5.2.2 /lib/x86_64-linux-gnu/liblzma.so \
  && ln -s /usr/lib/x86_64-linux-gnu/libicuuc.so.57 /lib/x86_64-linux-gnu/libicuuc.so \
  && ln -s /usr/lib/x86_64-linux-gnu/libicui18n.so.57 /lib/x86_64-linux-gnu/libicui18n.so
  
RUN R -e "install.packages('Rserve',,'http://www.rforge.net/')"&& \
    R -e "install.packages('data.table',version = '1.11.8')"&& \
    R -e "install.packages('dplyr',version = '0.7.7')"&& \
    R -e "install.packages('lubridate',version = '1.5.0')"&& \
    R -e "install.packages('stringr',version = '1.0.0')"&& \
    R -e "install.packages('forecast',version = '8.3')"&& \
    R -e "install.packages('tidyr',version = '0.4.1')"&& \
    R -e "install.packages('RJDBC',version = '0.2-4')"&& \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY init /init
EXPOSE 6311 8787

CMD bash /init
#ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
#CMD ["R", "CMD", "Rserve"]
#CMD /init&&R -e "Rserve::run.Rserve(remote=TRUE)" 
