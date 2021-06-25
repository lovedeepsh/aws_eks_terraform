env:
	export AWS_PROFILE=tl

clean:
	rm -rf .terraform

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

all:
	make env
	make clean
	make init
	make apply

destroy:
	terraform destroy
