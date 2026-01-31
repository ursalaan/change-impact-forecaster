.PHONY: run test docker

run:
	uvicorn cif.main:app --reload

test:
	pytest -ra

docker:
	docker build -t change-impact-forecaster .
	docker run -p 8000:8000 change-impact-forecaster
