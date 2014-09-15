BatchRestartAsConsoleUser
=========================

If the batch file starts as any other user than local console session user it restarts itself as console user(Currently logged in user).
Useful if you are running programs from system service or running scheduled tasks as "local system" user.

Notes:
Task Scheduler Service must be running.
RDP sessions do not have any active console session.
