run-screen-%.desktop: run-screen.desktop.template
	sed 's/SCREEN/$*/' $< > $@

install: dyndns.service dyndns.timer start-browsers.desktop
	sudo cp dyndns.service dyndns.timer /etc/systemd/system/
	ln -s $$PWD/start-browsers.desktop ~/.config/autostart/

.PHONY: install
