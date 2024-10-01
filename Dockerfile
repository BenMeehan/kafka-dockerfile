FROM confluentinc/cp-kafka:latest

# Set up environment variables for KRaft
ENV KAFKA_KRAFT_MODE=true
ENV KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092
ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092
ENV KAFKA_LOG_DIRS=/var/lib/kafka/data
ENV KAFKA_CONFLUENT_SUPPORT_METRICS_ENABLE=false
ENV KAFKA_PROCESS_ROLES=broker
ENV KAFKA_KRAFT_LOG_DIRS=/var/lib/kafka/data
ENV KAFKA_METADATA_LOG_DIRS=/var/lib/kafka/meta
ENV CLUSTER_ID=ben-kafka-cluster

# Create data directories
RUN mkdir -p /var/lib/kafka/data /var/lib/kafka/meta

# Expose Kafka port
EXPOSE 9092
