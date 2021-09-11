FROM python:3.6

RUN useradd -ms /bin/bash kafkauser
USER kafkauser

WORKDIR /home/kafkauser

COPY Kafka-Producer/requirements.txt .

RUN pip install -r requirements.txt && rm requirements.txt

COPY Kafka-Producer/src .


RUN pwd
RUN ls
USER root
RUN apt-get update && apt-get upgrade
RUN apt-get install default-jdk -y
USER kafkauser
RUN wget https://archive.apache.org/dist/kafka/2.2.0/kafka_2.12-2.2.0.tgz
RUN tar -xvf kafka_2.12-2.2.0.tgz
RUN mkdir kafka
RUN mv kafka_2.12-2.2.0.tgz kafka
RUN java -version
#RUN pwd
#RUN cd kafka_2.12-2.2.0/
#RUN pwd
#RUN ls
RUN /home/kafkauser/kafka_2.12-2.2.0/bin/zookeeper-server-start.sh /home/kafkauser/kafka_2.12-2.2.0/config/zookeeper.properties & 
RUN sleep 30
RUN /home/kafkauser/kafka_2.12-2.2.0/bin/kafka-server-start.sh /home/kafkauser/kafka_2.12-2.2.0/config/server.properties &
RUN sleep 30
RUN /home/kafkauser/kafka_2.12-2.2.0/bin/kafka-topics.sh --list --bootstrap-server localhost:9092 
RUN /home/kafkauser/kafka_2.12-2.2.0/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic house-price-prediction
RUN /home/kafkauser/kafka_2.12-2.2.0/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
RUN python TestDataStreamProducer.py
RUN sleep(300)


#ENTRYPOINT
          #bin/zookeeper-server-start.sh config/zookeeper.properties & 
          #sleep 30
          #bin/kafka-server-start.sh config/server.properties &
          #sleep 30
          #bin/kafka-topics.sh --list --bootstrap-server localhost:9092 
          #bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic house-price-prediction
          #bin/kafka-topics.sh --list --bootstrap-server localhost:9092
          #Kafka-Producer/src/TestDataStreamProducer.py






