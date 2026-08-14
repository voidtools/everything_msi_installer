# Everything MSI Installer

WiX source for the Everything MSI installer.

The MSI installer is intended for **mass deployment of Everything** in managed Windows environments.



## Download

https://www.voidtools.com/downloads/#all15



## Installation

The MSI can be installed with `msiexec`:

```cmd
msiexec /i Everything.msi
```

The installer properties can be used to customize the installation. All properties default to `1` (enabled).

For example, to install Everything without the desktop shortcut:

```cmd
msiexec /i Everything.msi DESKTOP_SHORTCUT=0
```



## Installer Properties

### EVERYTHING_SERVICE

Installs and starts the Everything Service.

The default value is `1`.

To disable the Everything Service:

```cmd
msiexec /i Everything.msi EVERYTHING_SERVICE=0
```

### START_ON_STARTUP

Runs Everything on system startup for all users.

The default value is `1`.

To disable starting Everything on system startup:

```cmd
msiexec /i Everything.msi START_ON_STARTUP=0
```

### START_MENU_SHORTCUT

Installs an Everything Start Menu shortcut for all users.

The default value is `1`.

To disable the Start Menu shortcut:

```cmd
msiexec /i Everything.msi START_MENU_SHORTCUT=0
```

### DESKTOP_SHORTCUT

Installs an Everything desktop shortcut for all users.

The default value is `1`.

To disable the desktop shortcut:

```cmd
msiexec /i Everything.msi DESKTOP_SHORTCUT=0
```

### EFU_ASSOCIATION

Registers `.efu` files with Everything for all users.

The default value is `1`.

To disable the EFU file association:

```cmd
msiexec /i Everything.msi EFU_ASSOCIATION=0
```

### LANGUAGE_PACK

Copies `Everything.lng` to the Everything installation folder.

The default value is `1`.

To disable the language pack:

```cmd
msiexec /i Everything.msi LANGUAGE_PACK=0
```

### APPDATA_EVERYTHING

Stores Everything settings and data in `%APPDATA%\Everything`.

The default value is `1`.

To disable `%APPDATA%\Everything`:

```cmd
msiexec /i Everything.msi APPDATA_EVERYTHING=0
```

## Silent Installation

Use `/qn` to install Everything silently without displaying the MSI user interface:

```cmd
msiexec /i Everything.msi /qn
```

Installer properties can be combined with `/qn` to customize a silent installation.

For example, to silently install Everything with the Everything Service, Start Menu shortcut, and EFU association, but without startup, desktop shortcut, language pack, or `%APPDATA%\Everything`:

```cmd
msiexec /i Everything.msi /qn START_ON_STARTUP=0 DESKTOP_SHORTCUT=0 LANGUAGE_PACK=0 APPDATA_EVERYTHING=0
```

## Uninstallation

To silently uninstall Everything:

```cmd
msiexec /x Everything.msi /qn
```

Alternatively, use the product code:

```cmd
msiexec /x {PRODUCT-CODE} /qn
```



## Downgrade

The MSI installer does not support downgrading to an older version.

To install an older version, uninstall the newer version first:

```cmd
msiexec /x Everything.msi /qn
msiexec /i Everything-older-version.msi /qn
```



## License

This project is licensed under the [MIT License](LICENSE).
