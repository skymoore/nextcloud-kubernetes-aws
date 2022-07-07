FROM nginx:1.22
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN chown -R 33:33 /etc/nginx
RUN chown -R 33:33 /var/cache/nginx
RUN chown 33:33 /var/run
EXPOSE 80