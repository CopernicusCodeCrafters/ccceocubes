FROM kwundram/ccceocubes:dep

# install packages from local directory
COPY ./ /opt/dockerfiles/
RUN Rscript -e "remotes::install_local('/opt/dockerfiles',dependencies=TRUE)"

# cmd or entrypoint for startup
CMD ["R", "-q", "--no-save", "-f /opt/dockerfiles/startProduction.R"]

EXPOSE 8000