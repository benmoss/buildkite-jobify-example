.PHONY: kaniko
kaniko:
	executor --dockerfile=Dockerfile --context=dir://. --destination=ttl.sh/bmo-test:1h