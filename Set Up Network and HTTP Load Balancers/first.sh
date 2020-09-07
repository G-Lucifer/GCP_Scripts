gcloud config set compute/zone us-central1-a

gcloud config set compute/region us-central1

cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF

gcloud compute instance-templates create nginx-template --metadata-from-file startup-script=startup.sh

gcloud compute target-pools create nginx-pool

gcloud compute instance-groups managed create nginx-group --base-instance-name nginx --size 2 --template nginx-template --target-pool nginx-pool

gcloud compute instances list
gcloud compute instances list
gcloud compute instances list

gcloud compute firewall-rules create www-firewall --allow tcp:80

gcloud compute instances list
gcloud compute instances list

