.PHONY: run test docker assess

run:
	uvicorn cif.main:app --reload

test:
	pytest -ra

docker:
	docker build -t change-impact-forecaster .
	docker run -p 8000:8000 change-impact-forecaster

assess:
	@if [ -z "$(FILE)" ]; then echo "Usage: make assess FILE=change.json"; exit 1; fi
	python -m cif.cli assess $(FILE)