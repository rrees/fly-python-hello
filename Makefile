.PHONY: waitress

waitress:
	pipenv run waitress-serve --port=8000 app.hello:app