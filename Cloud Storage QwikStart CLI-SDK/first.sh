gsutil mb gs://fcvjhbgkguvyguvyyu/
wget --output-document ada.jpg https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Ada_Lovelace_portrait.jpg/800px-Ada_Lovelace_portrait.jpg
gsutil cp ada.jpg gs://fcvjhbgkguvyguvyyu
rm ada.jpg
gsutil cp -r gs://fcvjhbgkguvyguvyyu/ada.jpg .
gsutil cp gs://fcvjhbgkguvyguvyyu/ada.jpg gs://fcvjhbgkguvyguvyyu/image-folder/
gsutil ls gs://fcvjhbgkguvyguvyyu
gsutil ls -l gs://fcvjhbgkguvyguvyyu/ada.jpg
gsutil acl ch -u AllUsers:R gs://fcvjhbgkguvyguvyyu/ada.jpg




gsutil acl ch -d AllUsers gs://fcvjhbgkguvyguvyyu/ada.jpg

gsutil rm gs://fcvjhbgkguvyguvyyu/ada.jpg