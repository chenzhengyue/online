#command
CC     = gcc
LD     = gcc
RM     = rm -f
AR     = ar
ECHO   = @echo

#flags
SLFIX  = .a
DLFIX  = .so
CFLAGS = -Wall -fpic -I$(HOME)/online/include
DLFLAG = -shared

#path
BINP   = $(HOME)/online/bin
LIBP   = $(HOME)/online/lib

#target
EXTARG  = $(BINP)/$(TARGET)
SLTARG  = $(LIBP)/lib$(TARGET)$(SLFIX)
DLTARG  = $(LIBP)/lib$(TARGET)$(DLFIX)

#include
-include $(OBJS:.o=.d)
%.d:%.c
	@set -e; $(RM) $@; \
	$(CC) -MM $< $(CFLAGS) > $@.$$$$ ; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	$(RM) $@.$$$$

#load
debugexec:$(EXTARG)
debugstatic:$(SLTARG)
debugdynamic:$(DLTARG)

#link
$(EXTARG):$(OBJS)
	$(ECHO) "Linking [$@]..."
	$(LD) -o $@ $^
	@$(RM) *.d

$(SLTARG):$(OBJS)
	$(ECHO) "Linking [$@]..."
	$(AR) -r $@ $^
	@$(RM) *.d

$(DLTARG):$(OBJS)
	$(ECHO) "Linking [$@]..."
	$(LD) -o $@ $^ $(DLFLAG)
	@$(RM) *.d

#compile
%.o:%.c
	$(ECHO) "Compiling [$@]..."
	$(CC) -c $< $(CFLAGS)

#clean
clean:
	$(RM) $(EXTARG) $(SLTARG) $(DLTARG) $(OBJS)
	@$(RM) *.d *.d.*
