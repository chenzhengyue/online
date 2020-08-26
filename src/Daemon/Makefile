TARGET = Daemon

OBJS = Daemon.o

LIBS =

debug all:debugexec

debugexec debugstatic debugdynamic clean:
	@make -f $(HOME)/online/mak/MkStand.mak --no-print-directory $@ TARGET="$(TARGET)" OBJS="$(OBJS)" LIBS="$(LIBS)"
