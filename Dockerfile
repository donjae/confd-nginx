FROM nginx

RUN cd confd/src/github.com/kelseyhightower/confd/ \
  && GOPATH=/Users/kelseyhightower/confd/vendor:/Users/kelseyhightower/confd go build .
#RUN mkdir -p /etc/confd/ 

COPY nginx.toml /etc/confd/conf.d/nginx.toml
COPY nginx.tmpl /etc/confd/templates/nginx.tmpl
COPY confd-watch /usr/local/bin/confd-watch

RUN rm -rf /etc/nginx/nginx.conf
RUN chmod +x /usr/local/bin/confd-watch

EXPOSE 80

CMD ["/usr/local/bin/confd-watch"]
