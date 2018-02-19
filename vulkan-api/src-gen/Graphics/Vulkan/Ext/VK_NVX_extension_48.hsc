#include "vulkan/vulkan.h"

{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE MagicHash       #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE Strict          #-}
{-# LANGUAGE ViewPatterns    #-}
module Graphics.Vulkan.Ext.VK_NVX_extension_48
       (-- * Vulkan extension: @VK_NVX_extension_48@
        -- |
        --
        -- supported: @disabled@
        --
        -- contact: @James Jones @cubanismo@
        --
        -- author: @NVX@
        --
        -- Extension number: @48@
        VK_NVX_EXTENSION_48_SPEC_VERSION,
        pattern VK_NVX_EXTENSION_48_SPEC_VERSION,
        VK_NVX_EXTENSION_48_EXTENSION_NAME,
        pattern VK_NVX_EXTENSION_48_EXTENSION_NAME)
       where
import           GHC.Ptr                 (Ptr (..))
import           Graphics.Vulkan.Marshal

pattern VK_NVX_EXTENSION_48_SPEC_VERSION :: (Num a, Eq a) => a

pattern VK_NVX_EXTENSION_48_SPEC_VERSION = 0

type VK_NVX_EXTENSION_48_SPEC_VERSION = 0

pattern VK_NVX_EXTENSION_48_EXTENSION_NAME :: CString

pattern VK_NVX_EXTENSION_48_EXTENSION_NAME <-
        (is_VK_NVX_EXTENSION_48_EXTENSION_NAME -> True)
  where VK_NVX_EXTENSION_48_EXTENSION_NAME
          = _VK_NVX_EXTENSION_48_EXTENSION_NAME

{-# INLINE _VK_NVX_EXTENSION_48_EXTENSION_NAME #-}

_VK_NVX_EXTENSION_48_EXTENSION_NAME :: CString
_VK_NVX_EXTENSION_48_EXTENSION_NAME
  = Ptr "VK_NVX_extension_48\NUL"##

{-# INLINE is_VK_NVX_EXTENSION_48_EXTENSION_NAME #-}

is_VK_NVX_EXTENSION_48_EXTENSION_NAME :: CString -> Bool
is_VK_NVX_EXTENSION_48_EXTENSION_NAME
  = eqCStrings _VK_NVX_EXTENSION_48_EXTENSION_NAME

type VK_NVX_EXTENSION_48_EXTENSION_NAME = "VK_NVX_extension_48"
