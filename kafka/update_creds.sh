#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail

# Load libraries
. /opt/bitnami/scripts/libfs.sh
. /opt/bitnami/scripts/libos.sh
. /opt/bitnami/scripts/libkafka.sh

# Load Kafka environment variables.
. /opt/bitnami/scripts/kafka-env.sh

export JMX_PORT=5557
export KAFKA_CONF_DIR=/opt/bitnami/kafka/config


export KAFKA_ZOOKEEPER_USER=zoouser
export KAFKA_ZOOKEEPER_PASSWORD=zoopass2
export KAFKA_INTER_BROKER_USER=brokeruser
export KAFKA_INTER_BROKER_PASSWORD=brokerpass2
export KAFKA_CLIENT_USERS=zoouser,adminuser,brokeruser
export KAFKA_CLIENT_PASSWORDS=zoopass2,adinpass2,brokerpass2

kafka_create_sasl_scram_zookeeper_users

mv /opt/bitnami/kafka/config/kafka_jaas.conf /opt/bitnami/kafka/config/kafka_jaas.previous
kafka_generate_jaas_authentication_file SASL SASL
