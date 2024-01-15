FROM kwundram/ccceocubes:dep2

# install packages from local directory
COPY ./ /opt/dockerfiles/
#for test:
COPY ./Trainingspolygone.json /var/openeo/workspace
#RUN Rscript -e "install.packages('caret',dependencies=TRUE)"
RUN Rscript -e "remotes::install_local('/opt/dockerfiles',dependencies=FALSE)"

# cmd or entrypoint for startup
CMD ["R", "-q", "--no-save", "-f /opt/dockerfiles/startProduction.R"]

EXPOSE 8000