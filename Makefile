.PHONY: install sandbox console run test evals evals-quick

install:
	python -m pip install -r requirements.txt
	python -m playwright install chromium

sandbox:         ## the simulated company only, on :8800
	python -m atlas sandbox

console:         ## operator console on :8000 (starts the sandbox too)
	python -m atlas console

run:             ## make run TASK="..." PRESET=chaos
	python -m atlas run "$(TASK)" --preset $(or $(PRESET),normal)

test:            ## offline test-suite: no API key needed
	python -m pytest

evals:           ## full scenario suite against the configured model
	python -m evals.run

evals-quick:
	python -m evals.run --only invoice_entry,invoice_entry_chaos,weekly_inbox_phishing
