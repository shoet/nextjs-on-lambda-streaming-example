.PHONY: help deploy-sls
.DEFAULT_GOAL := help

## Default stage
STAGE=dev 

deploy-sls: ## Build and Deploy by Serverless
	sls deploy --stage=${STAGE} --verbose

deploy-sam: ## Build and Deploy by SAM
	sam build
	sam deploy

help: ## Show options
	@grep -E '^[a-zA-Z_]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
