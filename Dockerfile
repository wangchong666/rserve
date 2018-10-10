FROM rocker/rstudio-stable:latest

RUN install2.r --error \
    -r "https://cran.rstudio.com" \
    Rserve && \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds


EXPOSE 6311 8787
#ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
#CMD ["R", "CMD", "Rserve"]
#CMD /init&&R -e "Rserve::run.Rserve(remote=TRUE)" 
