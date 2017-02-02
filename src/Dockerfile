FROM golang

RUN go get -v github.com/spf13/hugo

WORKDIR /site

ADD . /site

ENTRYPOINT /go/bin/hugo server

EXPOSE 1313
