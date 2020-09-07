
gcloud beta compute instances create nucleus-jumphost --zone=us-east1-b --machine-type=f1-micro --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --tags=http-server --image=debian-9-stretch-v20200309 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=nucleus-jumphost --reservation-affinity=any

gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

gcloud config set compute/zone us-east1-b

gcloud container clusters create nucleus-webserver1

gcloud container clusters get-credentials nucleus-webserver1

kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:2.0

kubectl expose deployment hello-app --type=LoadBalancer --port 8080

kubectl get service
kubectl get service
kubectl get service
kubectl get service

cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF

gcloud compute instance-templates create nginx-template --metadata-from-file startup-script=startup.sh


