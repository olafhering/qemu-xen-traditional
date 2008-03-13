CPPFLAGS+= -I$(XEN_ROOT)/tools/libxc
CPPFLAGS+= -I$(XEN_ROOT)/tools/xenstore
CPPFLAGS+= -I$(XEN_ROOT)/tools/include

SSE2 := $(call cc-option,$(CC),-msse2,)
ifeq ($(SSE2),-msse2)
CFLAGS += -DUSE_SSE2=1 -msse2
endif

QEMU_PROG=qemu-dm

CFLAGS += -Wno-unused -Werror

LIBS += -L../../libxc -lxenctrl -lxenguest
LIBS += -L../../xenstore -lxenstore

LDFLAGS := $(CFLAGS) $(LDFLAGS)

OBJS += loader.o
OBJS += piix4acpi.o
OBJS += xenstore.o
OBJS += xen_platform.o
OBJS += xen_machine_fv.o
OBJS += xen_machine_pv.o
OBJS += xenfb.o
OBJS += xen_console.o
OBJS += xen_machine_fv.o

BAD_OBJS += monitor.o

OBJS := $(filter-out $(BAD_OBJS), $(OBJS))