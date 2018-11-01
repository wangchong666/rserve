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
    R -e "install.packages('data.table','1.11.8','http://www.rforge.net/')"&& \
    R -e "install.packages('dplyr','0.7.7','http://www.rforge.net/')"&& \
    R -e "install.packages('lubridate','1.5.0','http://www.rforge.net/')"&& \
    R -e "install.packages('stringr','1.0.0','http://www.rforge.net/')"&& \
    R -e "install.packages('forecast','8.3','http://www.rforge.net/')"&& \
    R -e "install.packages('tidyr','0.4.1','http://www.rforge.net/')"&& \
    R -e "install.packages('RJDBC','0.2-4','http://www.rforge.net/')"&& \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY init /init
EXPOSE 6311 8787

CMD bash /init
#ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
#CMD ["R", "CMD", "Rserve"]
#CMD /init&&R -e "Rserve::run.Rserve(remote=TRUE)" 
