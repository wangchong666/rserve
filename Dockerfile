# vim:set ft=dockerfile:
FROM alpine:edge
LABEL maintainer="gebele@in-silico.ch"
LABEL io.openrisknet.tags rserve
LABEL io.openrisknet.non-scalable true
LABEL io.openshift.expose-services 6311
LABEL io.openrisknet.min-memory 2Gi
LABEL io.openrisknet.min-cpu 4
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
ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
#CMD ["R", "CMD", "Rserve"]
