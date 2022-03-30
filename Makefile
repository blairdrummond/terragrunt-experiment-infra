CLUSTER_NAME := liatrio-demo

init:
	terraform init

plan apply destroy: init
	export TF_VAR_cluster_name=$(CLUSTER_NAME); \
	. ./secrets.env ; \
	cd environments && terragrunt run-all $@