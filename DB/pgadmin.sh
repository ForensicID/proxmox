#!/bin/bash

if curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg; then
  echo "GET Packages from pgadmin .."
  sleep 1
else
  echo "Cant GET Packages from pgadmin .."
  sleep 0.5
fi

if sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'; then
  echo "Update Packages .."
  sleep 1
else
  echo "CANT Update Packages .."
  sleep 0.5
fi

if apt install pgadmin4 -y; then
  echo "Install pgadmin .."
  sleep 1
else
  echo "CANT Install pgadmin .."
  sleep 0.5
fi

if sudo /usr/pgadmin4/bin/setup-web.sh -y; then
  echo "Setup pgadmin web .."
  sleep 1
else
  echo "CANT Setup pgadmin web | RUN sudo /usr/pgadmin4/bin/setup-web.sh"
  sleep 0.5
fi
