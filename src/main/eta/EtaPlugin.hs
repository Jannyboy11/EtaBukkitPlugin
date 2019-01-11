{-# LANGUAGE FlexibleContexts, DataKinds, TypeFamilies, TypeOperators, OverloadedStrings #-}

module EtaPlugin where

import Java

data Plugin = Plugin @org.bukkit.plugin.Plugin
   deriving Class

data JavaPlugin = JavaPlugin @org.bukkit.plugin.java.JavaPlugin
   deriving Class

data EtaPlugin = EtaPlugin @com.janboerman.hukkit.EtaPlugin
   deriving Class

type instance Inherits JavaPlugin = '[Plugin]
type instance Inherits EtaPlugin = '[JavaPlugin]

data Logger = Logger @java.util.logging.Logger
   deriving Class

foreign import java unsafe "info" info :: JString -> Java a ()

foreign import java unsafe "@interface getLogger" getLogger :: (p <: Plugin) => Java p Logger


onEnable :: Java EtaPlugin ()
onEnable = do
   logger <- getLogger
   info "Hello from Eta!"
   return ()

foreign export java "onEnable" onEnable :: Java EtaPlugin ()
