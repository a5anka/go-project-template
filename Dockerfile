FROM ubuntu:latest  

WORKDIR /root/

COPY /build/hello .

CMD ["./hello"] 