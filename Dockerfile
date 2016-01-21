FROM nginx

RUN mkdir -p /etc/confd/ && cd /usr/local/bin && 
  && chmod +x confd

COPY nginx.toml /etc/confd/conf.d/nginx.toml
COPY templates/nginx.tmpl /etc/confd/templates/nginx.tmpl
COPY confd-watch /usr/local/bin/confd-watch

RUN rm -rf /etc/nginx/nginx.conf
RUN chmod +x /usr/local/bin/confd-watch

EXPOSE 80

CMD ["/usr/local/bin/confd-watch"]
