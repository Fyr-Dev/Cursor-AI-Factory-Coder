# Makefile for AI Coding Factory Setup
.PHONY: build populate monitor prioritize full_clean
build:
	@echo "Running Setup Script..."
	./setup_project.sh
populate:
	@echo "Populating Memory Bank..."
	./populate_memory_bank.sh
monitor:
	@echo "Starting Task Monitoring Dashboard..."
	./task_dashboard.sh
prioritize:
	@echo "Running Task Prioritization Engine..."
	./prioritize_tasks.sh
full_clean:
	@echo "Cleaning Project Directory..."
	rm -rf memory_bank
	rm -rf scripts
	rm -rf tasks
	echo "Cleaned project structure."
