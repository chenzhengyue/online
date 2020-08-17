CC = gcc

TARG = Daemon
OBJS = \
    Daemon.o\
    Test.o

.PHONY:all
all:$(TARG)

$(TARG):$(OBJS)
	$(CC) -o $@ $^

%.o:%.c
	$(CC) -c $< -I$(HOME)/online/include

%.d:%.c
	@set -e; $(CC) -MM $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \

include $(OBJS:.o=.d)

.PHONY:clean
clean:
	rm -f $(TARG) $(OBJS)
