mkdir gcf_hello_world
cd gcf_hello_world

gsutil mb -p qwiklabs-gcp-03-79f968012e93 gs://qwiklabs-gcp-03-79f968012e93bucket
gcloud functions deploy helloWorld \
  --stage-bucket gs://qwiklabs-gcp-03-79f968012e93bucket \
  --trigger-topic hello_world \
  --runtime nodejs6
gcloud functions describe helloWorld

gcloud functions describe helloWorld
gcloud functions call helloWorld --data '{"message":"Hello World!"}'
gcloud functions logs read helloWorld
