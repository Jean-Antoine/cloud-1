# cloud-1
## Deploy infra
```
cd infra
terraform apply
```
## Deploy Website Infra on EC2
```
ansible-playbook -i ansible/inventory.ini ansible/playbook.yml
```
