# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Makefile
# NOTE: Do not change the contents of this file!
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

include .env

################################
# VARIABLES
################################

PYTHON:=python3
ifeq ($(OS),Windows_NT)
PYTHON=py -3
endif

################################
# Macros
################################

define delete_if_file_exists
	@if [ -f "$(1)" ]; then rm "$(1)"; fi
endef

define clean_all_files
	@find . -type f -name "$(1)" -exec basename {} \;
	@find . -type f -name "$(1)" -exec rm {} \; 2> /dev/null
endef

define clean_all_folders
	@find . -type d -name "$(1)" -exec basename {} \;
	@find . -type d -name "$(1)" -exec rm -rf {} \; 2> /dev/null
endef

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TARGETS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

################################
# BASIC TARGETS: setup, build, run
################################
setup:
	@echo "Call \x1b[93;1mcd src && npm init\x1b[0m in order to set up src/package.json, if it does not exist."
build:
	@cp .env src/
	@cd src && npm upgrade
run:
	@cd src && node main.js
all: setup build run
################################
# TARGETS: clean
################################
clean:
	@echo "All system artefacts will be force removed."
	@$(call clean_all_files,.DS_Store)
	@echo "All build artefacts will be force removed."
	@$(call clean_all_folders,__pycache__)
	@$(call delete_if_file_exists,src/package-lock.json)
	@$(call delete_if_file_exists,src/.env)
	@$(call delete_if_file_exists,src/node_modules)
	@exit 0
