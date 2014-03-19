include common.mk

run:
	@echo "Running OTP app in the foreground ..."
	@ERL_LIBS=$(ERL_LIBS) $(LFE) -eval "application:start('lfebot')"

daemon:
	@echo "Running OTP app in the background ..."
	@ERL_LIBS=$(ERL_LIBS) $(LFE) \
	-eval "application:start('lfebot')" -detached -noshell
