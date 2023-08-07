.PHONY: app/kill # Kills app container
app/kill:
	docker compose kill app

.PHONY: app/logs # Shows app container logs
app/logs:
	docker compose logs --follow --since 10 app

.PHONY: app/restart # Restarts app container
app/restart: app/kill app/rm app/up app/logs

.PHONY: app/rm # Removes app container
app/rm:
	docker compose rm app --force

.PHONY: app/terminal # Opens a terminal in app container
app/terminal:
	docker compose run --rm app bash

.PHONY: app/up # Run app containers
app/up:
	docker compose up app --detach
