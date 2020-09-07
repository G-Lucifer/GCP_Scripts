
gcloud compute instance-groups managed create nginx-group --base-instance-name nginx --size 2 --template nginx-template --target-pool nginx-pool

gcloud compute instances list


gcloud compute firewall-rules create www-firewall --allow tcp:80

gcloud compute forwarding-rules create nginx-lb --region us-east1 --ports=80 --target-pool nginx-pool

gcloud compute forwarding-rules list

gcloud compute http-health-checks create http-basic-check

gcloud compute instance-groups managed set-named-ports nginx-group --named-ports http:80

gcloud compute backend-services create nginx-backend --protocol HTTP --http-health-checks http-basic-check --global

gcloud compute backend-services add-backend nginx-backend --instance-group nginx-group --instance-group-zone us-east1-b --global

gcloud compute url-maps create web-map --default-service nginx-backend

gcloud compute target-http-proxies create http-lb-proxy --url-map web-map


gcloud compute forwarding-rules create http-content-rule --global --target-http-proxy http-lb-proxy --ports 80


gcloud compute forwarding-rules list