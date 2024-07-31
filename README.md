# LACConfigurationFiles
Configuration files for LAC integration management application


Modify /etc/mysql/mysql.conf.d/mysqld.cnf

change bind_address to 0.0.0.0


sudo ln -s /etc/nginx/sites-available/lac-integration-manager-front-end.conf /etc/nginx/sites-enabled/lac-integration-manager-front-end.conf

sudo ln -s /etc/nginx/sites-available/lac-ws-callback-receiver.conf /etc/nginx/sites-enabled/lac-ws-callback-receiver.conf
