#command

CC     = gcc
LD     = gcc
RM     = rm -f

#flags and path

CFLAGS = -Wall -I$(HOME)/online/include

BINP   = $(HOME)/online/bin

EXTARG  = $(BINP)/$(TARG)

.PHONY:all
all:$(EXTARG)

$(EXTARG):$(OBJS)
	$(LD) -o $@ $^
	@$(RM) *.d

%.o:%.c
	$(CC) -c $< $(CFLAGS)

%.d:%.c
	@set -e; $(RM) $@; \
	$(CC) -MM $< $(CFLAGS) > $@.$$$$ ; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	$(RM) $@.$$$$

-include $(OBJS:.o=.d)

.PHONY:clean
clean:
	$(RM) $(EXTARG) $(OBJS)
	@$(RM) *.d *.d.*
