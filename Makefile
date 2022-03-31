CLUSTER_NAME := liatrio-demo

OKGREEN := '\033[92m'
ENDC := '\033[0m'
BOLD := '\033[1m'

init:
	cd environments && terragrunt run-all $@

plan apply destroy: init
	export TF_VAR_cluster_name=$(CLUSTER_NAME); \
	. ./secrets.env ; \
	cd environments && terragrunt run-all $@

argo-workflows-login:
	@printf $(OKGREEN)
	@printf $(BOLD)
	@echo "Argo Workflows Login: http://localhost:2746"
	@echo "=========================="
	@printf "Argo Workflows Token is: \n"
	@kubectl -n argo exec $$(kubectl get pod -n argo | grep argo-server | awk '{print $$1}') -- argo auth token
	@echo "=========================="
	@printf $(ENDC)
	kubectl port-forward -n argo svc/argo-server 2746:2746
