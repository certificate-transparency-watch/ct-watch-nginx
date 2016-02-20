build-and-deploy:
	docker build -t certificate-transparency-watch-docker-ct-watch-registry.bintray.io/ct-watch-nginx .
	docker push certificate-transparency-watch-docker-ct-watch-registry.bintray.io/ct-watch-nginx
