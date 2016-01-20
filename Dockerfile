FROM nginx

RUN cd /usr/local/bin && chmod +x confd




RUN chmod +x /usr/local/bin/confd-watch

EXPOSE 80

CMD ["/usr/local/bin/confd-watch"]
