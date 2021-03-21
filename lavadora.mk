################################################################################
#
# Lavadora simplificada - Sistemas Embarcados - IFMT
#
################################################################################

LAVADORA_VERSION = 1.0
LAVADORA_SITE = https://github.com/lsfs/lavadora_raspberry
LAVADORA_SITE_METHOD = git
LAVADORA_DEPENDENCIES = python-rpi-gpio

define LAVADORA_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/lavadora*
	mkdir -p $(TARGET_DIR)/usr/local/bin/
	cp -R $(@D) $(TARGET_DIR)/usr/local/bin/
endef

define LAVADORA_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0755 $(LAVADORA_PKGDIR)/S70lavadora $(TARGET_DIR)/etc/init.d/
endef

LAVADORA_POST_INSTALL_TARGET_HOOKS += LAVADORA_INSTALL_INIT_SCRIPT

$(eval $(generic-package))


