# builde the docker image (named tech_website) (. mean stay in the same repository you can change an othet repository)
# make build --> commad
tag=latest
organization=martialsoh
image=tech_website_image

build:
	docker build --force-rm $(options) -t tech_website_image:latest .

build-prod:
	$(MAKE) build options="--target production"

push:
	docker tag $(image):latest $(organization)/$(image):$(tag)
	docker push $(organization)/$(image):$(tag)

compose-start:
	docker-compose up --remove-orphans $(options)

compose-stop:
	docker-compose down --remove-orphans $(options)

compose-manage-py:
	docker-compose run --rm $(options) website python3 manage.py $(cmd)

start-server:
	python3 manage.py runserver 0.0.0.0:80

helm-deploy:
	helm upgrade --install django-web ./helm/django-website
