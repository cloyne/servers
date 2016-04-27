docker:
  containers:
    # Chaos Calmer (stable)
    builder-openwrt-vb106cfb-cc-ar71xx:
      image: wlanslovenija/openwrt-builder
      tag: vb106cfb_cc_ar71xx
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJRIhg6p3vUyzfD7kzi8K8eCy9J2+M8DPXfpjYug4ws5Fal3XN9pKtrdROljxMDOLgOLZp1os5/8fn/OoHAkKA/M3mP8no+n16dXHzjoCyiYwDVMb7kEDffUcIEoCXVPaLMlbuK0VRmHlk2DBDA4doxKY43oqL7sAAEV6rGEtUq0OLRA8sgdpq6nxL58Otn7Ad2TyDtWVb5qtrOt+6V7+HXFXUjL0JYEur+OvU3gTjw7/etPkWcnOqSeOkc9UCl/hw19Z8cEQem05rBFcWpFk66XQSdr7zun2rDnkuKcZlKFceNtivnixLIRlsviveEwlUNnVfk0dVCbmkRm7UaQmd builder@cloyne.net
        VIRTUAL_HOST: packages.cloyne.net
        VIRTUAL_URL: /firmware/git.bd5903b/openwrt/chaos_calmer/ar71xx/
    builder-openwrt-vb106cfb-cc-ar71xx_mikrotik:
      image: wlanslovenija/openwrt-builder
      tag: vb106cfb_cc_ar71xx_mikrotik
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJRIhg6p3vUyzfD7kzi8K8eCy9J2+M8DPXfpjYug4ws5Fal3XN9pKtrdROljxMDOLgOLZp1os5/8fn/OoHAkKA/M3mP8no+n16dXHzjoCyiYwDVMb7kEDffUcIEoCXVPaLMlbuK0VRmHlk2DBDA4doxKY43oqL7sAAEV6rGEtUq0OLRA8sgdpq6nxL58Otn7Ad2TyDtWVb5qtrOt+6V7+HXFXUjL0JYEur+OvU3gTjw7/etPkWcnOqSeOkc9UCl/hw19Z8cEQem05rBFcWpFk66XQSdr7zun2rDnkuKcZlKFceNtivnixLIRlsviveEwlUNnVfk0dVCbmkRm7UaQmd builder@cloyne.net
        VIRTUAL_HOST: packages.cloyne.net
        VIRTUAL_URL: /firmware/git.bd5903b/openwrt/chaos_calmer/ar71xx_mikrotik/
