#!/bin/bash

CONF_FILE=/etc/vmware_exporter.yaml

sed -i "s|vmware_user: .*|vmware_user: '$VMWARE_USER'|" $CONF_FILE
sed -i "s|vmware_password: .*|vmware_password: '$VMWARE_PASSWORD'|" $CONF_FILE
sed -i "s|ignore_ssl: .*|ignore_ssl: $IGNORE_SSL|" $CONF_FILE

vmware_exporter -c $CONF_FILE
