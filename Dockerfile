# Use the Confluent Kafka image
FROM confluentinc/cp-kafka:7.7.1

# Set environment variables for Kafka
ENV KAFKA_NODE_ID=1 \
    KAFKA_LISTENER_SECURITY_PROTOCOL_MAP='CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT' \
    KAFKA_ADVERTISED_LISTENERS='PLAINTEXT://localhost:29092,PLAINTEXT_HOST://localhost:9092' \
    KAFKA_JMX_PORT=9101 \
    KAFKA_JMX_HOSTNAME=localhost \
    KAFKA_PROCESS_ROLES='broker,controller' \
    KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
    KAFKA_CONTROLLER_QUORUM_VOTERS='1@localhost:29093' \
    KAFKA_LISTENERS='PLAINTEXT://localhost:29092,CONTROLLER://localhost:29093,PLAINTEXT_HOST://0.0.0.0:9092' \
    KAFKA_INTER_BROKER_LISTENER_NAME='PLAINTEXT' \
    KAFKA_CONTROLLER_LISTENER_NAMES='CONTROLLER' \
    CLUSTER_ID='ben-kafka-kraft-ewfd3r423rfds' \
    KAFKA_MAX_REQUEST_SIZE=209715200 \ 
    KAFKA_MESSAGE_MAX_BYTES=209715200 \ 
    KAFKA_REPLICA_FETCH_MAX_BYTES=209715200

# Expose necessary ports
EXPOSE 9092 9101

# Start Kafka
CMD ["bash", "-c", "/etc/confluent/docker/run"]
