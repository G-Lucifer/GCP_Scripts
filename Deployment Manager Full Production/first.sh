sudo apt-get update
sudo apt-get install -y virtualenv 
virtualenv -p python3 venv
source venv/bin/activate
mkdir ~/dmsamples
cd ~/dmsamples
git clone https://github.com/GoogleCloudPlatform/deploymentmanager-samples.git
cd ~/dmsamples/deploymentmanager-samples/examples/v2
ls
cd nodejs/python
ls
gcloud compute zones list
