#!/bin/bash

# if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "MariaDB data directory is empty. Performing initial setup..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

    echo "Initial MariaDB data directory setup complete."

    echo "Starting MariaDB temporarily for initialization..."
    /usr/sbin/mariadbd --user=mysql --skip-networking --skip-log-error &
    MARIADB_PID=$!

    echo "Waiting for MariaDB to be ready..."
    until mariadb -h localhost -u root -e "SELECT 1;" > /dev/null 2>&1; do
      echo "MariaDB is unavailable - sleeping"
      sleep 2
    done
    echo "MariaDB is up - executing initialization commands"

    mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');

FLUSH PRIVILEGES;
EOF

    echo "MariaDB initialization finished. Stopping temporary server..."
    kill $MARIADB_PID
    wait $MARIADB_PID
    echo "Temporary MariaDB server stopped."

# else
#     echo "MariaDB data directory already exists. Skipping initial setup."
# fi

echo "Starting MariaDB server in foreground..."
exec /usr/sbin/mariadbd --user=mysql --console