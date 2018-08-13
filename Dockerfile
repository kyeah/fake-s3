FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# install Ruby
RUN apt-get update && apt-get install -yqq ruby rubygems-integration

# install fake-s3
COPY fakes3-0.2.4.gem /app/fakes3-0.2.4.gem

WORKDIR /app
RUN gem install ./fakes3-0.2.4.gem

# run fake-s3
RUN mkdir -p /fakes3_root
ENTRYPOINT ["/usr/local/bin/fakes3"]
CMD ["-r",  "/fakes3_root", "-p",  "4569", "-H", "s3"]
EXPOSE 4569
