CLUSTER_NAME := liatrio-demo

init:
	terraform init

plan apply: init
	export TF_VAR_cluster_name=$(CLUSTER_NAME); \
		terraform $@
