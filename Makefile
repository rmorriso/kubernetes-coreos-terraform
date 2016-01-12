plan: etcd_discovery_url.txt kube_token.txt
	terraform plan 

apply: etcd_discovery_url.txt kube_token.txt
	terraform apply

destroy:
	terraform destroy
	rm etcd_discovery_url.txt kube_token.txt

etcd_discovery_url.txt:
	curl -s https://discovery.etcd.io/new?size=3 > etcd_discovery_url.txt

kube_token.txt:
	openssl rand -base64 8 |md5 |head -c8 > kube_token.txt
	echo >> kube_token.txt
