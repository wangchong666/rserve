FROM alpine

RUN apk add --update musl-utils build-base R R-dev cairo-dev grep
RUN R -e 'install.packages("caret", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("pls", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("randomForest", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("gridExtra", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("doMC", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("Rserve", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("stringi", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("iterators", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("foreach", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'
RUN R -e 'install.packages("ggplot2", repos="https://stat.ethz.ch/CRAN/",dependencies=TRUE)'

EXPOSE 6311
#ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
CMD ["R", "CMD", "Rserve"]
