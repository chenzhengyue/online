CC = gcc
CFLAGS = -I$(HOME)/online/include -Wall

TARG = Daemon
OBJS = \
    Daemon.o\
    Test.o

.PHONY:all
all:$(TARG)

$(TARG):$(OBJS)
	$(CC) -o $@ $^
	@rm -f *.d

%.o:%.c
	$(CC) -c $< $(CFLAGS)

%.d:%.c
	@set -e; rm -f $@; \
	$(CC) -MM $< $(CFLAGS) > $@.$$$$ ; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

-include $(OBJS:.o=.d)

.PHONY:clean
clean:
	rm -f $(TARG) $(OBJS)
	@rm -f *.d *.d.*
