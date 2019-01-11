# EtaPlugin

A bukkit plugin written in Eta, a dialect of Haskell for the JVM

### How to compile
`gradlew shadowJar` and the plugin will end up in the `build/libs` directory.

### Known issues
There is this nasty `"java.lang.ClassFormatError Illegal class name "" in class file etabukkitplugin/EtaPlugin"` when the plugin enables.
