FROM docker.io/bitnami/mariadb:10.3
MAINTAINER joaquin

## Change user to perform privileged actions
USER 0

RUN mkdir -p /var/lib/apt/lists/partial
RUN apt-get update
RUN apt-get install cron -y

#RUN install_packages cron
COPY ./data_prestashop_db/comando_crontab /etc/cron.d/proyecto1
RUN chmod 0644 /etc/cron.d/proyecto1
RUN crontab /etc/cron.d/proyecto1

CMD ["cron"]
ENTRYPOINT [ "/opt/bitnami/scripts/mariadb/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/mariadb/run.sh" ]
#CMD ["cron"]
