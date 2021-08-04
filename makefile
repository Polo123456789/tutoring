rwildcard =$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

SOURCES := $(call rwildcard, ., *.md)
PRESENTATIONS := $(patsubst %.md, %.html, $(SOURCES))

CC := pandoc
FLAGS := -f markdown -t revealjs -s

CLEAN_CMD := del

.PHONY: default
default: $(PRESENTATIONS)

$(PRESENTATIONS): %.html: %.md
	$(CC) $(FLAGS) $< -o $@

.PHONY: clean
clean:
	$(CLEAN_CMD) $(subst /,\,$(PRESENTATIONS))
