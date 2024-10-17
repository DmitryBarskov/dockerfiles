exercism:
	docker build -t exercism -f exercism.Dockerfile .

heroku:
	docker build -t heroku -f heroku.Dockerfile .
