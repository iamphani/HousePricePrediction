/home/kafkauser/kafka_2.12-2.2.0/bin/zookeeper-server-start.sh /home/kafkauser/kafka_2.12-2.2.0/config/zookeeper.properties & 
sleep 30,
/home/kafkauser/kafka_2.12-2.2.0/bin/kafka-server-start.sh /home/kafkauser/kafka_2.12-2.2.0/config/server.properties &
sleep 30
/home/kafkauser/kafka_2.12-2.2.0/bin/kafka-topics.sh --list --bootstrap-server localhost:9092 
/home/kafkauser/kafka_2.12-2.2.0/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic house-price-prediction
/home/kafkauser/kafka_2.12-2.2.0/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
python ./TestDataStreamProducer.py
