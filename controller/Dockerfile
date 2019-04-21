# build
FROM		golang:1.12.1 as builder
ENV		GO111MODULE=on
WORKDIR         /go/src/github.com/ultreme/radio-imaginee/controller
COPY            go.mod go.sum ./
RUN		go mod download
COPY            . .
RUN		go get .
RUN             go build -ldflags '-extldflags "-static"' -tags netgo -v -o /go/bin/controller

# minimal runtime
FROM            alpine
COPY            --from=builder /go/bin/controller /bin/controller
ENTRYPOINT      ["/bin/controller"]
CMD             []
EXPOSE          8042
#HEALTHCHECK     CMD /bin/controller healthcheck --wait