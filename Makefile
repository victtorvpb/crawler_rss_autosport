install:
	pipenv sync
install-requirements-dev:
	pipenv sync --dev
pep8:
	pipenv run flake8 .
formatter:
	pipenv run black . -S -v --py36 --exclude .venv -l 99 
	make pep8
clean:
	pipenv --rm
build-docker:
	docker build . -t crawler_rss_autesporte
start-docker:
	docker-compose up -d
generate-file: start-docker
	docker-compose exec api python execute.py
	docker-compose stop